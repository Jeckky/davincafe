class RequestException implements Exception {
  late int statusCode;
  late dynamic data;
  String? message;
  String? subMessage;

  RequestException({
    this.data,
    required this.statusCode,
    this.message,
    this.subMessage,
  });

  @override
  String toString() {
    return "statusCode : $statusCode\ndata : $data message: $message subMessage: $subMessage";
  }
}
