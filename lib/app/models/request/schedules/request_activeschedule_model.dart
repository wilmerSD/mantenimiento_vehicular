class RequestActiveScheduleModel {
  int idProfile;
  List<int> idSchedules;
  int status;
  String idUser;

  RequestActiveScheduleModel({
    required this.idProfile,
    required this.idSchedules,
    required this.status,
    required this.idUser,
  });

  Map<String, dynamic> toJson() => {
        "idProfile": idProfile,
        "idSchedules": List<dynamic>.from(idSchedules.map((x) => x)),
        "status": status,
        "idUser": idUser,
      };
}
