
class CommonResponse<T>{
  String status;
  int code;
  String msg;
  T data;

  CommonResponse(this.status,this.code,this.msg,this.data);

}