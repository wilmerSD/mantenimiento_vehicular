class ResponseRequestAsignedToLeaderModel {
  bool? success;
  int? statusCode;
  int? count;
  List<DataAsignedToLeader>? data;
  int? pageCount;
  int? pageIndex;
  int? pageSize;

  ResponseRequestAsignedToLeaderModel({
    this.success,
    this.statusCode,
    this.count,
    this.data,
    this.pageCount,
    this.pageIndex,
    this.pageSize,
  });

  factory ResponseRequestAsignedToLeaderModel.fromJson(
          Map<String, dynamic> json) =>
      ResponseRequestAsignedToLeaderModel(
        success: json["success"],
        statusCode: json["status_code"],
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<DataAsignedToLeader>.from(
                json["data"]!.map((x) => DataAsignedToLeader.fromJson(x))),
        pageCount: json["pageCount"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
      );
}

class DataAsignedToLeader {
  int? id;
  int? idTipoSolicitud;
  int? idUsuario;
  DateTime? fecha;
  String? fechaPermiso;
  String? fechaDesde;
  String? fechaHasta;
  int? idTMarcaciones;
  String? motivo;
  int? estadoSolicitudF;
  int? estadoSolicitudS;
  int? updatedByF;
  int? updatedByS;
  dynamic tiempoPermiso;
  String? descripcionTipoSolicitud;
  String? descripcionEstadoSolicitud;
  String? descripcionTipoMarcacion;
  String? nombreActualizadoPorF;
  String? apellidosActualizadoPorF;
  String? nombreActualizadoPorS;
  String? apellidosActualizadoPorS;
  String? nombreTrabajador;
  String? apellidosTrabajador;
  String? dni;
  String? hora;
  int? idHorario;
  String? horaInicio;
  String? horaFin;
  int? idDiaExcepcion;
  String? dia;
  String? horaInicioExcepcion;
  String? horaFinExcepcion;

  bool? isCheck;

  DataAsignedToLeader({
    this.id,
    this.idTipoSolicitud,
    this.idUsuario,
    this.fecha,
    this.fechaPermiso,
    this.fechaDesde,
    this.fechaHasta,
    this.idTMarcaciones,
    this.motivo,
    this.estadoSolicitudF,
    this.estadoSolicitudS,
    this.updatedByF,
    this.updatedByS,
    this.tiempoPermiso,
    this.descripcionTipoSolicitud,
    this.descripcionEstadoSolicitud,
    this.descripcionTipoMarcacion,
    this.nombreActualizadoPorF,
    this.apellidosActualizadoPorF,
    this.nombreActualizadoPorS,
    this.apellidosActualizadoPorS,
    this.nombreTrabajador,
    this.apellidosTrabajador,
    this.dni,
    this.hora,
    this.idHorario,
    this.horaInicio,
    this.horaFin,
    this.idDiaExcepcion,
    this.dia,
    this.horaInicioExcepcion,
    this.horaFinExcepcion,
    this.isCheck,
  });

  factory DataAsignedToLeader.fromJson(Map<String, dynamic> json) =>
      DataAsignedToLeader(
          id: json["id"],
          idTipoSolicitud: json["idTipoSolicitud"],
          idUsuario: json["idUsuario"],
          fecha: json["Fecha"] == null ? null : DateTime.parse(json["Fecha"]),
          fechaPermiso: json["FechaPermiso"],
          fechaDesde: json["FechaDesde"],
          fechaHasta: json["FechaHasta"],
          idTMarcaciones: json["idTMarcaciones"],
          motivo: json["Motivo"],
          estadoSolicitudF: json["estadoSolicitudF"],
          estadoSolicitudS: json["estadoSolicitudS"],
          updatedByF: json["Updated_byF"],
          updatedByS: json["Updated_byS"],
          tiempoPermiso: json["tiempoPermiso"],
          descripcionTipoSolicitud: json["descripcionTipoSolicitud"],
          descripcionEstadoSolicitud: json["descripcionEstadoSolicitud"],
          descripcionTipoMarcacion: json["descripcionTipoMarcacion"],
          nombreActualizadoPorF: json["NombreActualizadoPorF"],
          apellidosActualizadoPorF: json["ApellidosActualizadoPorF"],
          nombreActualizadoPorS: json["NombreActualizadoPorS"],
          apellidosActualizadoPorS: json["ApellidosActualizadoPorS"],
          nombreTrabajador: json["nombreTrabajador"],
          apellidosTrabajador: json["ApellidosTrabajador"],
          dni: json["DNI"],
          hora: json["Hora"],
          idHorario: json["idHorario"],
          horaInicio: json["HoraInicio"],
          horaFin: json["HoraFin"],
          idDiaExcepcion: json["diaExcepcion"],
          dia: json["Día"],
          horaInicioExcepcion: json["HoraInicio_Excepcion"],
          horaFinExcepcion: json["HoraFin_Excepcion"],
          isCheck: false);
}
