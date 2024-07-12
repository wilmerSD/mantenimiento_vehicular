class RequestFilterTypesModel {
    String? name;
    int? idStateEnabled;
    int? idStateDisabled;
    String? idUser;

    RequestFilterTypesModel({
        this.name,
        this.idStateEnabled,
        this.idStateDisabled,
        this.idUser,
    });

    Map<String, dynamic> toMap() => {
        "name": name,
        "idStateEnabled": idStateEnabled,
        "idStateDisabled": idStateDisabled,
        "idUser": idUser,
    };
}
