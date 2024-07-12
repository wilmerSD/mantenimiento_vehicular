class RequestUpdateJustificationsModel {
  String date;
  int idUser;
  int idTypeMark;
  int idStatusJustification;
  String hour;
  int idUserModifier;

  RequestUpdateJustificationsModel({
    required this.date,
    required this.idUser,
    required this.idTypeMark,
    required this.idStatusJustification,
    required this.hour,
    required this.idUserModifier,
  });

  Map<String, dynamic> toJson() => {
        "date": date,
        "idUser": idUser,
        "idTypeMark": idTypeMark,
        "idStatusJustification": idStatusJustification,
        "hour": hour,
        "idUserModifier": idUserModifier,
      };
}
