package user

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	jsoniter "github.com/json-iterator/go"
	user_encode "glory-api/common"
	"glory-api/models"
	result "glory-api/util"
)

// LoginInfoController operations for LoginInfo
type LoginInfoController struct {
	beego.Controller
}

// URLMapping ...
func (c *LoginInfoController) URLMapping() {
	c.Mapping("login", c.DoLogin)
	c.Mapping("register", c.Register)
}

/**
 * 用户登录接口
 */
// GetOne ...
// @Title 登录
// @Description 用户登录接口
// @Param	username		path 	string	true		"用户名"
// @Param	password		path 	string	true		"密码"
// @Success 200 {object} util.ResponseResult
// @Failure 400 用户名，密码不能为空
// @router /login [post]
func (c *LoginInfoController) DoLogin() {
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

// @router /register [post]
func (c *LoginInfoController) Register() {

	var form models.RegisterForm
	//接受requestBody
	data := c.Ctx.Input.RequestBody
	//json数据封装到LoginForm对象中
	var json = jsoniter.ConfigCompatibleWithStandardLibrary //号称全宇宙最快的json解析包
	err := json.Unmarshal(data, &form)

	//form := models.RegisterForm{}
	//if err := c.ParseForm(&form); err != nil {
	//	beego.Debug("errParseRegsiterForm:", err)
	//	c.Data["json"] = user_encode.ErrInputData
	//	c.ServeJSON()
	//	return
	//}
	logs.Debug("ParseRegsiterForm:", &form)
	appid := user_encode.To_md5(form.Username)
	secret := user_encode.To_md5(form.Email)
	user, err := models.NewUser(&form, appid, secret)
	if err != nil {
		logs.Error("NewUser:", err)
		c.Data["json"] = user_encode.ErrSystem
		c.ServeJSON()
		return
	}
	logs.Debug("NewUser:", user)
	user.Insert()
	//if _, err := user.Insert(); err != nil {
	//	beego.Error("InsertUser:", err)
	//	c.Data["json"] = "系统错误"
	//	c.ServeJSON()
	//}
	//c.Data["json"] = user_encode.Actionsuccess
	c.Data["json"] = result.SuccessResult("注册成功！")
	c.ServeJSON()
}
