class RequestVacationSvgModel {
    String? codigo;
    String? perfil;
    String? inicio;
    String? fin;
    String? adelanto;
    String? idUser;

    RequestVacationSvgModel({
        this.codigo,
        this.perfil,
        this.inicio,
        this.fin,
        this.adelanto,
        this.idUser,
    });

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "perfil": perfil,
        "inicio": inicio,
        "fin": fin,
        "adelanto": adelanto,
        "idUser": idUser,
    };
}