class RequestGetJustificationsModel {
  String name;
  int? idEstadoJustP;
  int? idEstadoJustJ;
  int? idEstadoJustR;
  int page;
  String idUser;

  RequestGetJustificationsModel({
    required this.name,
    this.idEstadoJustP,
    this.idEstadoJustJ,
    this.idEstadoJustR,
    required this.page,
    required this.idUser,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "IdEstadoJustP": idEstadoJustP,
        "IdEstadoJustJ": idEstadoJustJ,
        "IdEstadoJustR": idEstadoJustR,
        "page": page,
        "idUser": idUser,
      };
}
