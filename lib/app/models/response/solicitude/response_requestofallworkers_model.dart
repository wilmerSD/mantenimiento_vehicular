class ResponseRequestOfAllWorkersModel {
    bool? success;
    int? statusCode;
    int? count;
    List<DataAllRequestOfAllWorkers>? data;
    int? pageCount;
    int? pageIndex;
    int? pageSize;

    ResponseRequestOfAllWorkersModel({
        this.success,
        this.statusCode,
        this.count,
        this.data,
        this.pageCount,
        this.pageIndex,
        this.pageSize,
    });

    factory ResponseRequestOfAllWorkersModel.fromJson(Map<String, dynamic> json) => ResponseRequestOfAllWorkersModel(
        success: json["success"],
        statusCode: json["status_code"],
        count: json["count"],
        data: json["data"] == null ? [] : List<DataAllRequestOfAllWorkers>.from(json["data"]!.map((x) => DataAllRequestOfAllWorkers.fromJson(x))),
        pageCount: json["pageCount"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
    );

}
class DataAllRequestOfAllWorkers {
    int? id;
    int? idTipoSolicitud;
    int? idUsuario;
    DateTime? fecha;
    DateTime? fechaPermiso;
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
    dynamic descripcionTipoMarcacion;
    String? nombreActualizadoPorF;
    String? apellidosActualizadoPorF;
    String? nombreActualizadoPorS;
    String? apellidosActualizadoPorS;
    String? nombreTrabajador;
    String? apellidosTrabajador;
    String? dni;
    dynamic hora;

    DataAllRequestOfAllWorkers({
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
    });

    factory DataAllRequestOfAllWorkers.fromJson(Map<String, dynamic> json) => DataAllRequestOfAllWorkers(
        id: json["id"],
        idTipoSolicitud: json["idTipoSolicitud"],
        idUsuario: json["idUsuario"],
        fecha: json["Fecha"] == null ? null : DateTime.parse(json["Fecha"]),
        fechaPermiso: json["FechaPermiso"] == null ? null : DateTime.parse(json["FechaPermiso"]),
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
    );

}