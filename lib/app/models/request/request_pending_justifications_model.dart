class RequestGetPendingJustificationsModel {
  int idEstadoJustP;
  String idUser;

  RequestGetPendingJustificationsModel({
    required this.idEstadoJustP,
    required this.idUser,
  });

  Map<String, dynamic> toJson() => {
        "IdEstadoJustP": idEstadoJustP,
        "idUser": idUser,
      };
}
