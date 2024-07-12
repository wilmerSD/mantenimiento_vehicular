class ResponseActiveScheduleModel {
  bool success;
  int statusCode;
  String statusMessage;
  Data data;

  ResponseActiveScheduleModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseActiveScheduleModel.fromJson(Map<String, dynamic> json) =>
      ResponseActiveScheduleModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
