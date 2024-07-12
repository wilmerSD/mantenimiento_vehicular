class RequestUpdateRolUser {
    int? idUser;
    int? idRol;
    int? id;

    RequestUpdateRolUser({
        this.idUser,
        this.idRol,
        this.id,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "idRol": idRol,
        "id": id,
    };
}
