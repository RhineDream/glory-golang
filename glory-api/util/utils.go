package result

import (
	"encoding/json"
	"net/http"
)

/**
封装请求返回值
2019年7月17日
结构体中的声明变量首字母必须大写 不然无法被beego解析
*/
type ResponseResult struct {
	Code int         `json:"code"`
	Msg  string      `json:"msg"`
	Data interface{} `json:"data"`
}

func SuccessResult(data interface{}) *ResponseResult {
	return &ResponseResult{200, "OK", data}
}

func FailedResult(errMsg string) *ResponseResult {
	return &ResponseResult{400, errMsg, ""}
}
func ErrorResult(code int,errMsg string) *ResponseResult {
	return &ResponseResult{code, errMsg, ""}
}

func ResponseWithJson(w http.ResponseWriter, code int, payload interface{}) {
	response, _ := json.Marshal(payload)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	w.Write(response)
}

