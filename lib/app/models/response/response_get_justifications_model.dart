class ResponseGetJustificationsModel {
  bool success;
  int statusCode;
  int count;
  List<Datum> data;
  int pageCount;
  int pageIndex;
  int pageSize;

  ResponseGetJustificationsModel({
    required this.success,
    required this.statusCode,
    required this.count,
    required this.data,
    required this.pageCount,
    required this.pageIndex,
    required this.pageSize,
  });

  factory ResponseGetJustificationsModel.fromJson(Map<String, dynamic> json) =>
      ResponseGetJustificationsModel(
        success: json["success"],
        statusCode: json["status_code"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pageCount: json["pageCount"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
      );
}

class Datum {
  String? cip;
  String nombreCompleto;
  int idEstadoJust;
  int idUsuario;
  String fecha;
  String motivo;
  int idTMarcaciones;
  String descripcion;
  String estado;
  String hora;
  String? encargado;

  Datum({
    required this.cip,
    required this.nombreCompleto,
    required this.idEstadoJust,
    required this.idUsuario,
    required this.fecha,
    required this.motivo,
    required this.idTMarcaciones,
    required this.descripcion,
    required this.estado,
    required this.hora,
    required this.encargado,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cip: json["CIP"],
        nombreCompleto: json["NombreCompleto"],
        idEstadoJust: json["IdEstadoJust"],
        idUsuario: json["IdUsuario"],
        fecha: json["Fecha"],
        motivo: json["Motivo"],
        idTMarcaciones: json["IdTMarcaciones"],
        descripcion: json["descripcion"],
        estado: json["estado"],
        hora: json["Hora"],
        encargado: json["Encargado"],
      );
}
