class ResponseAllWorkersModel {
  bool success;
  int statusCode;
  int count;
  List<DatumWorkers> data;
  int pageCount;
  int pageIndex;
  int pageSize;

  ResponseAllWorkersModel({
    required this.success,
    required this.statusCode,
    required this.count,
    required this.data,
    required this.pageCount,
    required this.pageIndex,
    required this.pageSize,
  });

  factory ResponseAllWorkersModel.fromJson(Map<String, dynamic> json) =>
      ResponseAllWorkersModel(
        success: json["success"],
        statusCode: json["status_code"],
        count: json["count"],
        data: List<DatumWorkers>.from(
            json["data"].map((x) => DatumWorkers.fromJson(x))),
        pageCount: json["pageCount"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
      );
}

class DatumWorkers {
    int? idUsuarios;
    String? nombres;
    String? apellidos;
    int? idEstado;
    String? usuario;
    String? dni;
    int? idRol;
    String? modalidad;
    int? idHorarios;
    String? estado;
    String? rol;
    int? idLeaderAsigned;
    String? nameLeader;
    String? lastnameLeader;
    String? fecha;
    int? scheduleTobeAssigned;
    int? idAsignador;
    String? nombresAsignador;
    String? apellidosAsignador;

  DatumWorkers({
    this.idUsuarios,
    this.nombres,
    this.apellidos,
    this.idEstado,
    this.usuario,
    this.dni,
    this.idRol,
    this.modalidad,
    this.idHorarios,
    this.estado,
    this.rol,
    this.idLeaderAsigned,
    this.nameLeader,
    this.lastnameLeader,
    this.fecha,
    this.scheduleTobeAssigned,
    this.idAsignador,
    this.nombresAsignador,
    this.apellidosAsignador,
  });

  factory DatumWorkers.fromJson(Map<String, dynamic> json) => DatumWorkers(
        idUsuarios: json["IdUsuarios"] ?? 0,
        nombres: json["Nombres"] ?? '',
        apellidos: json["Apellidos"] ?? '',
        idEstado: json["idEstado"] ?? 0,
        usuario: json["Usuario"] ?? '',
        dni: json["DNI"] ?? '',
        idRol: json["IdRol"],
        modalidad: json["Modalidad"] ?? '',
        idHorarios: json["IdHorarios"] ?? 0,
        estado: json["Estado"] ?? '',
        rol: json["Rol"] ?? '',
        idLeaderAsigned: json["idLeaderAsigned"] ?? 0,
        nameLeader: json["nameLeader"] ?? '',
        lastnameLeader: json["lastnameLeader"] ?? '',
        fecha: json["fecha"],
        scheduleTobeAssigned: json["scheduleTobeAssigned"],
        idAsignador: json["idAsignador"],
        nombresAsignador: json["nombresAsignador"],
        apellidosAsignador: json["ApellidosAsignador"],
      );
}

class ResponseAllWorkersCounterModel {
  bool? success;
  int? statusCode;
  String? statusMessage;
  int? data;

  ResponseAllWorkersCounterModel({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.data,
  });

  factory ResponseAllWorkersCounterModel.fromJson(Map<String, dynamic> json) =>
      ResponseAllWorkersCounterModel(
        success: json["success"] ?? false,
        statusCode: json["status_code"] ?? '',
        statusMessage: json["status_message"] ?? '',
        data: json["data"] ?? 2,
      );
}
