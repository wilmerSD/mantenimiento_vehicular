class RequestAssistanceInformationModel {
    int idUser;//Persona de quien se esta consultando el historial 
    String date;
    String userId;

    RequestAssistanceInformationModel({
        required this.idUser,
        required this.date,
        required this.userId,
    });
    Map<String, dynamic>  toMap() => {
        "idUser": idUser,
        "date": date,
        "userId": userId,
    };
}
