class RequestManagementOfRequestModel {
    int? idUser;
    int? estadoSolicitudF;
    List<int>? ids;

    RequestManagementOfRequestModel({
        this.idUser,
        this.estadoSolicitudF,
        this.ids,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "estadoSolicitudF": estadoSolicitudF,
        "ids": ids == null ? [] : List<dynamic>.from(ids!.map((x) => x)),
    };
}