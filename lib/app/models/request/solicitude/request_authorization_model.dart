class RequestAddAuthorizationModel {
  int? idUser;
  String? date;
  String? reason;
  int? idUserAuthorizer;
  int? timePermission;

  RequestAddAuthorizationModel({
    this.idUser,
    this.date,
    this.reason,
    this.idUserAuthorizer,
    this.timePermission,
  });

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "date": date,
        "reason": reason,
        "idUserAuthorizer": idUserAuthorizer,
        "timePermission": timePermission,
      };
}
