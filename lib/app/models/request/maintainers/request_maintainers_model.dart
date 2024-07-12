class RequestMaintainersModel {
    int? idUser;
    String? description;
    int? id;

    RequestMaintainersModel({
        this.idUser,
        this.description,
        this.id,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "description": description,
        "id": id,
    };
}