class RequestAllScheduleModel {
    int idHorario;
    int idStatus;
    String? idUser;

    RequestAllScheduleModel({
        required this.idHorario,
        required this.idStatus,
        required this.idUser,
    });


    Map<String, dynamic> toJson() => {
        "idHorario": idHorario,
        "idStatus": idStatus,
        "idUser": idUser,
    };
}