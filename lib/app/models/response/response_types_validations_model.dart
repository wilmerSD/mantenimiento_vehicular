class ResponseTypesValidationsModel {
  bool success;
  int statusCode;
  String statusMessage;
  List<Datum> data;

  ResponseTypesValidationsModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseTypesValidationsModel.fromJson(Map<String, dynamic> json) =>
      ResponseTypesValidationsModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

}

class Datum {
  int? idValidacion;
  String? descripcion;
  int? idEstado;
  String? descriptionState;

  Datum({
    this.idValidacion,
    this.descripcion,
    this.idEstado,
    this.descriptionState,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idValidacion: json["idValidacion"],
        descripcion: json["descripcion"],
        idEstado: json["idEstado"],
        descriptionState: json["descriptionState"],
      );
}
