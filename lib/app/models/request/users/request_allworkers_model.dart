class RequestAllWorkersModel {
  int idUser;
  String name;
  String CIP;
  String DNI;
  int idEstateWorkerA;
  int idEstateWorkerI;
  int page;

  RequestAllWorkersModel({
    required this.idUser,
    required this.name,
    required this.CIP,
    required this.DNI,
    required this.idEstateWorkerA,
    required this.idEstateWorkerI,
    required this.page,
  });

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "name": name,
        "CIP": CIP,
        "DNI": DNI,
        "IdEstateWorkerA": idEstateWorkerA,
        "IdEstateWorkerI": idEstateWorkerI,
        "page": page,
      };
}
