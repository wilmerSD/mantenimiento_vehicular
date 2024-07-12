class ResponseAddVacationsModel {
  bool success;
  int statusCode;
  String statusMessage;
  String data;

  ResponseAddVacationsModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseAddVacationsModel.fromJson(Map<String, dynamic> json) =>
      ResponseAddVacationsModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}
