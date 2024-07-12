class RequestChangePassModel {
    int? idUser;
    String? password;
    String? code;

    RequestChangePassModel({
        this.idUser,
        this.password,
        this.code,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "password": password,
        "code": code,
    };
}