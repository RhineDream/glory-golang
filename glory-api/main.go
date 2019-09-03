package main

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
	_ "github.com/astaxie/beego/session/redis"
	_ "github.com/go-sql-driver/mysql"
	user_encode "jwt_demo/common"
	_ "jwt_demo/routers"
	result "jwt_demo/util"
)

func main() {
	beego.Run()
}

func init() {

	//配置日志模块
	l := logs.GetLogger()
	l.Println("this is a message of http")
	logs.GetLogger("ORM").Println("this is a message of orm")

	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", "root:root@tcp(127.0.0.1:3306)/go-demo?charset=utf8&parseTime=True&loc=Local", 30, 30)
	orm.Debug = true

	//访问接口前验证token
	var filterUser = func(ctx *context.Context) {
		if ctx.Request.RequestURI != "/login" && ctx.Request.RequestURI != "/access_token" {
			token := ctx.Input.Header("Authorization")
			if token == "" {
				logs.Info("token为空！")
				result.ResponseWithJson(ctx.ResponseWriter, 400, result.FailedResult("token为空"))
				return
			}
			appid, err := user_encode.Token_auth(token, "secret")
			if err != nil {
				//http.Error(ctx.ResponseWriter, "Token verification not pass", http.StatusBadRequest)
				result.ResponseWithJson(ctx.ResponseWriter, 400, result.FailedResult("token无效"))
				return
			}
			logs.Info("appid---------", appid)

			logs.Info("Request token---------", token)
		}
	}

	beego.InsertFilter("/*", beego.BeforeRouter, filterUser)

}
