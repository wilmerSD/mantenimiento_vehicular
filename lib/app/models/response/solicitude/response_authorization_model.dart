class ResponseAddAuthorizationModel {
  bool success;
  int statusCode;
  String statusMessage;
  String data;

  ResponseAddAuthorizationModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseAddAuthorizationModel.fromJson(Map<String, dynamic> json) =>
      ResponseAddAuthorizationModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}
