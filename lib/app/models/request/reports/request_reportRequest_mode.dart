class RequestReportRequestModel {
  int? idTiposSolicitud;
  DateTime? fechaInicio;
  DateTime? fechaFin;
  String? idUser;

  RequestReportRequestModel({
    this.idTiposSolicitud,
    this.fechaInicio,
    this.fechaFin,
    this.idUser,
  });
  Map<String, dynamic> toJson() => {
        "idTiposSolicitud": idTiposSolicitud,
        "FechaInicio":
            "${fechaInicio!.year.toString().padLeft(4, '0')}-${fechaInicio!.month.toString().padLeft(2, '0')}-${fechaInicio!.day.toString().padLeft(2, '0')}",
        "FechaFin":
            "${fechaFin!.year.toString().padLeft(4, '0')}-${fechaFin!.month.toString().padLeft(2, '0')}-${fechaFin!.day.toString().padLeft(2, '0')}",
        "idUser": idUser,
      };
}
