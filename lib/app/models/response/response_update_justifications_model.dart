class ResponseUpdateJustificationsModel {
  bool success;
  int statusCode;
  String statusMessage;
  String data;

  ResponseUpdateJustificationsModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseUpdateJustificationsModel.fromJson(
          Map<String, dynamic> json) =>
      ResponseUpdateJustificationsModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}

class DatumSelect {
  int? value;
  String? text;

  DatumSelect({
    required this.value,
    required this.text,
  });

  factory DatumSelect.fromJson(Map<String, dynamic> json) => DatumSelect(
        value: json["value"],
        text: json["text"],
      );
}
