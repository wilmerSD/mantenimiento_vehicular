/* class RequestAddSchedulesToUserModel {
    int idUsers;
    int idSchedule;

    RequestAddSchedulesToUserModel({
        required this.idUsers,
        required this.idSchedule,
    });

    Map<String, dynamic> toMap() => {
        "idUsers": idUsers,
        "idSchedule": idSchedule,
    };
} */
class RequestAddSchedulesToUserModel{
  int idUsers;
  int idSchedule;
  String? idUser;

  RequestAddSchedulesToUserModel({
    required this.idUsers,
    required this.idSchedule,
    required this.idUser,
  });

  Map<String, dynamic> toJson() => {
        "idUsers": idUsers,
        "idSchedule": idSchedule,
        "idUser": idUser,
      };
}
