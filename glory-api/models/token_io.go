package models

// RegisterForm definiton.
type CreateTokenForm struct {
	Appid  string `form:"appid"`
	Secret string `form:"secret"`
}

// {
//     "code": 0,
//     "user": {
//         "Username": "admin",
//         "Passwd": "f56fae5d8aec27accdc69179c1ff909e118441262aeb71bfec5a7f03d6d9ed4b0e1724c7641b02a0a1820774564f8043058a8f163744f7a7a5a4513c9ce34ce4",
//         "Salt": "5dc074c3a99a7393da5baf07dcc0ff62136ac6cc5cf9a2bc2bd55045324d6e1554f9562197443df4f6acd8d559a81d364ec37e80e902eca7ac54e4bbcac8745b",
//         "Id": 1,
//         "Create_time": "2019-09-02 22:03:52 +0800 CST",
//         "Appid": "ISMvKXpXpadDiUoOSoAfww==",
//         "Secret": "SH+HUF9hm/nqCPJrs0+BGA==",
//         "Role_id": 1,
//         "Email": "123@qq.com"
//     }
// }
