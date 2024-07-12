class ResponseModifyScheduleModel {
  bool success;
  int statusCode;
  String statusMessage;
  String data;

  ResponseModifyScheduleModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseModifyScheduleModel.fromJson(Map<String, dynamic> json) =>
      ResponseModifyScheduleModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}
