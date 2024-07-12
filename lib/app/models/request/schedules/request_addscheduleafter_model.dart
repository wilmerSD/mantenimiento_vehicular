class RequestAddScheduleAfterModel {
    int? idAsignador;
    int? idWorker;
    String? fecha;
    int? idHorarios;
    String? idUser;

    RequestAddScheduleAfterModel({
        this.idAsignador,
        this.idWorker,
        this.fecha,
        this.idHorarios,
        this.idUser,
    });

    Map<String, dynamic> toJson() => {
        "idAsignador": idAsignador,
        "idWorker": idWorker,
        "fecha": fecha,
        "idHorarios": idHorarios,
        "idUser": idUser,
    };
}
