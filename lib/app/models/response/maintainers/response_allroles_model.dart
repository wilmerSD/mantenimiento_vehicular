class ResponseAllRolesModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    List<DatumRoles>? data;

    ResponseAllRolesModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseAllRolesModel.fromJson(Map<String, dynamic> json) => ResponseAllRolesModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<DatumRoles>.from(json["data"]!.map((x) => DatumRoles.fromJson(x))),
    );

}

class DatumRoles {
    int? idRol;
    String? nombre;
    int? idEstado;
    String? descriptionState;

    DatumRoles({
        this.idRol,
        this.nombre,
        this.idEstado,
        this.descriptionState,
    });

    factory DatumRoles.fromJson(Map<String, dynamic> json) => DatumRoles(
        idRol: json["idRol"],
        nombre: json["Nombre"],
        idEstado: json["idEstado"],
        descriptionState: json["descriptionState"],
    );
}