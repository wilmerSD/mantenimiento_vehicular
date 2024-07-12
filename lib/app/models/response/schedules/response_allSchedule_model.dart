class ResponseAllScheduleModel {
  bool success;
  int statusCode;
  String statusMessage;
  List<DatumSchedule> data;

  ResponseAllScheduleModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseAllScheduleModel.fromJson(Map<String, dynamic> json) =>
      ResponseAllScheduleModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: List<DatumSchedule>.from(
            json["data"].map((x) => DatumSchedule.fromJson(x))),
      );
}

class DatumSchedule {
  int idHorarios;
  String horaInicio;
  String horaFin;
  int? idRefrigerio;
  int? horaRefrigerio;
  String? horaInicioRefrigerio;
  String? horaFinRefrigerio;
  int idDescanso;
  String descanso;
  int IdDiaExcepcion;
  String? DiaExcepcion;
  int? IdExcepcion;
  String? HoraInicio_Excepcion;
  String? HoraFin_Excepcion;
  int IdEstado;
  String Descripcion;

  DatumSchedule({
    required this.idHorarios,
    required this.horaInicio,
    required this.horaFin,
    required this.idRefrigerio,
    required this.horaRefrigerio,
    required this.horaInicioRefrigerio,
    required this.horaFinRefrigerio,
    required this.idDescanso,
    required this.descanso,
    required this.IdDiaExcepcion,
    required this.DiaExcepcion,
    required this.IdExcepcion,
    required this.HoraInicio_Excepcion,
    required this.HoraFin_Excepcion,
    required this.IdEstado,
    required this.Descripcion,
  });

  factory DatumSchedule.fromJson(Map<String, dynamic> json) => DatumSchedule(
        idHorarios: json["IdHorarios"],
        horaInicio: json["HoraInicio"],
        horaFin: json["HoraFin"],
        idRefrigerio: json["idRefrigerio"],
        horaRefrigerio: json["HoraRefrigerio"],
        horaInicioRefrigerio: json["HoraInicioRefrigerio"],
        horaFinRefrigerio: json["HoraFinRefrigerio"],
        idDescanso: json["IdDescanso"],
        descanso: json["Descanso"],
        IdDiaExcepcion: json["IdDiaExcepcion"],
        DiaExcepcion: json["DiaExcepcion"],
        IdExcepcion: json["IdExcepcion"],
        HoraInicio_Excepcion: json["HoraInicio_Excepcion"],
        HoraFin_Excepcion: json["HoraFin_Excepcion"],
        IdEstado: json["IdEstado"],
        Descripcion: json["Descripcion"],
      );
}
