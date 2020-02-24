class Response {
  int status;
  String message;
  Response(Map<String, dynamic> data) {
    status = data['status'];
    message = data['message'];
  }
}
