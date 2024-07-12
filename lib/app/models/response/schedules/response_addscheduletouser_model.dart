class ResponseAddScheduleToUserModel {
  bool success;
  int statusCode;
  String statusMessage;
  String data;

  ResponseAddScheduleToUserModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseAddScheduleToUserModel.fromJson(Map<String, dynamic> json) =>
      ResponseAddScheduleToUserModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}
