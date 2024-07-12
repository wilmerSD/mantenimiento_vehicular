class ResponseGetPendingJustificationsModel {
  bool success;
  int statusCode;
  String statusMessage;
  int data;

  ResponseGetPendingJustificationsModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseGetPendingJustificationsModel.fromJson(
          Map<String, dynamic> json) =>
      ResponseGetPendingJustificationsModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}
