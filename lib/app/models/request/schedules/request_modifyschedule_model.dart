class RequestModifyScheduleModel {
  int idSchedule;
  String timeStart;
  String timeEnd;
  int idRestDay;
  int idStatus;
  int dayException;
  String timeStartException;
  String timeEndException;
  bool? haveRefreshment;
  int timeRefreshment;
  String? idUser;

  RequestModifyScheduleModel({
    required this.idSchedule,
    required this.timeStart,
    required this.timeEnd,
    required this.idRestDay,
    required this.idStatus,
    required this.dayException,
    required this.timeStartException,
    required this.timeEndException,
    required this.haveRefreshment,
    required this.timeRefreshment,
    required this.idUser,
  });

  Map<String, dynamic> toJson() => {
        "idSchedule": idSchedule,
        "timeStart": timeStart,
        "timeEnd": timeEnd,
        "idRestDay": idRestDay,
        "idStatus": idStatus,
        "dayException": dayException,
        "timeStartException": timeStartException,
        "timeEndException": timeEndException,
        "haveRefreshment": haveRefreshment,
        "timeRefreshment": timeRefreshment,
        "idUser": idUser,
      };
}
