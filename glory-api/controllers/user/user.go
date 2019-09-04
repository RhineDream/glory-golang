package user

import (
	"fmt"
	"github.com/astaxie/beego/logs"

	//	"encoding/hex"
	//"strings"
	"glory-api/common"
	"glory-api/models"
	"glory-api/util"

	"github.com/astaxie/beego"
	"github.com/json-iterator/go"
)

type LoginController struct {
	beego.Controller
}
type RegisterController struct {
	beego.Controller
}
type LoginoutController struct {
	beego.Controller
}
type FindpasswdController struct {
	beego.Controller
}
type ChangepasswdController struct {
	beego.Controller
}
type ChangeuserroleController struct {
	beego.Controller
}

/**
 * 用户登录接口
 */
func (c *LoginController) Post() {
	var form models.LoginForm
	//接受requestBody
	data := c.Ctx.Input.RequestBody
	//json数据封装到LoginForm对象中
	var json = jsoniter.ConfigCompatibleWithStandardLibrary //号称全宇宙最快的json解析包
	err := json.Unmarshal(data, &form)

	if err != nil {
		fmt.Println("json.Unmarshal is err:", err.Error())
	}
	logs.Info("ParseLoginForm", &form)

	user := models.User{}
	if _, err := user.FindByID(form.Username); err != nil {
		logs.Error("ParseLoginForm", &form)
		c.Data["json"] = result.FailedResult("该账户不存在")
		c.ServeJSON()
		return
	}
	logs.Debug("UserInfo:", &user)

	ok, err := user.CheckPass(form.Password)
	if !ok {
		logs.Error("ParseLoginForm", &form)
		c.Data["json"] = result.FailedResult("账号或密码错误")
		c.ServeJSON()
		return
	}
	c.Data["json"] = result.SuccessResult(&user)
	c.ServeJSON()
}

func (c *RegisterController) Post() {

	form := models.RegisterForm{}
	if err := c.ParseForm(&form); err != nil {
		beego.Debug("errParseRegsiterForm:", err)
		c.Data["json"] = user_encode.ErrInputData
		c.ServeJSON()
		return
	}
	beego.Debug("ParseRegsiterForm:", &form)
	appid := user_encode.To_md5(form.Username)
	secret := user_encode.To_md5(form.Email)
	user, err := models.NewUser(&form, appid, secret)
	if err != nil {
		beego.Error("NewUser:", err)
		c.Data["json"] = user_encode.ErrSystem
		c.ServeJSON()
		return
	}
	beego.Debug("NewUser:", user)
	user.Insert()
	/*if _, err := user.Insert(); err != nil {
		beego.Error("InsertUser:", err)
		c.Data["json"] = "系统错误"
		c.ServeJSON()
	}*/
	c.Data["json"] = user_encode.Actionsuccess
	c.ServeJSON()
}

func (c *LoginoutController) Post() {
	c.Data["json"] = user_encode.Err404
	c.ServeJSON()
}

func (c *FindpasswdController) Post() {

	c.Data["json"] = user_encode.Err404
	c.ServeJSON()
}

func (c *ChangepasswdController) Post() {

	c.Data["json"] = user_encode.Err404
	c.ServeJSON()
}

func (c *ChangeuserroleController) Post() {
	form := models.ChangeuserroleForm{}
	if err := c.ParseForm(&form); err != nil {
		beego.Debug("ParseLoginForm:", err)
		//c.Data["json"] = common.NewErrorInfo(ErrInputData)
		c.Data["json"] = user_encode.ErrInputData
		c.ServeJSON()
		return
	}
	err := models.Update_user_role(form.Id, form.Username)
	if err != nil {
		beego.Error("NewUser:", err)
		c.Data["json"] = user_encode.ErrSystem
		c.ServeJSON()
		return
	}
	c.Data["json"] = user_encode.Actionsuccess
	c.ServeJSON()
}
