package token

import (
	"fmt"
	"github.com/astaxie/beego/logs"
	jsoniter "github.com/json-iterator/go"
	"jwt_demo/common"
	"jwt_demo/models"
	result "jwt_demo/util"

	//"fmt"
	//"reflect"
	"strconv"

	"github.com/astaxie/beego"
)

type AccessTokenController struct {
	beego.Controller
}

type RefreshtokenController struct {
	beego.Controller
}

type UserToken struct {
	Token      string
	Appid      string
	Secret     string
	Express_in int64
}

/*验证appid 和 secret，下发token*/
func (c *AccessTokenController) Post() {

	var userToken models.CreateTokenForm
	//接受requestBody
	jsonBody := c.Ctx.Input.RequestBody
	//json数据封装到LoginForm对象中
	var json = jsoniter.ConfigCompatibleWithStandardLibrary	//号称全宇宙最快的json解析包
	err := json.Unmarshal(jsonBody, &userToken)

	if err != nil {
		fmt.Println("json.Unmarshal is err:", err.Error())
	}
	logs.Info("userToken------", &userToken)

	var T UserToken
	T.Token, T.Express_in = user_encode.Create_token(userToken.Appid, userToken.Secret)
	express_in := strconv.FormatInt(T.Express_in, 10)
	token_model, err := models.NewToken(&userToken, T.Token, express_in)
	if err != nil {
		logs.Error("NewUser:", err)
		c.Data["json"] = result.ErrorResult(500,"服务器错误")
		c.ServeJSON()
		return
	}
	logs.Debug("NewUser:", token_model)
	token_model.Insert()
	T.Appid = userToken.Appid
	T.Secret = userToken.Secret

	c.Data["json"] = result.SuccessResult(&T)
	c.ServeJSON()
}
