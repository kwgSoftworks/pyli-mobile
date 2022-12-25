class AResponse{
  bool error;
  String? message;
  String? token;
  dynamic data;

  AResponse({
    required this.error,
    this.message,
    this.token,
    this.data
  });
}