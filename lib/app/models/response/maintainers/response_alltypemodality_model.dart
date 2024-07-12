class ResponseAllTypeModalityModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    List<DatumAllTypeModality>? data;

    ResponseAllTypeModalityModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseAllTypeModalityModel.fromJson(Map<String, dynamic> json) => ResponseAllTypeModalityModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<DatumAllTypeModality>.from(json["data"]!.map((x) => DatumAllTypeModality.fromJson(x))),
    );
}

class DatumAllTypeModality {
    int? idModalidad;
    String? descripcion;
    int? idEstado;
    String? descriptionState;

    DatumAllTypeModality({
        this.idModalidad,
        this.descripcion,
        this.idEstado,
        this.descriptionState,
    });

    factory DatumAllTypeModality.fromJson(Map<String, dynamic> json) => DatumAllTypeModality(
        idModalidad: json["IdModalidad"],
        descripcion: json["Descripcion"],
        idEstado: json["IdEstado"],
        descriptionState: json["descriptionState"],
    );
}