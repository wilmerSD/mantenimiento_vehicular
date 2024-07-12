class ResponseAllTypeValidationModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    List<DatumAllTypeValidation>? data;

    ResponseAllTypeValidationModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseAllTypeValidationModel.fromJson(Map<String, dynamic> json) => ResponseAllTypeValidationModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<DatumAllTypeValidation>.from(json["data"]!.map((x) => DatumAllTypeValidation.fromJson(x))),
    );

}

class DatumAllTypeValidation {
    int? idValidacion;
    String? descripcion;
    int? idEstado;
    String? descriptionState;

    DatumAllTypeValidation({
        this.idValidacion,
        this.descripcion,
        this.idEstado,
        this.descriptionState,
    });

    factory DatumAllTypeValidation.fromJson(Map<String, dynamic> json) => DatumAllTypeValidation(
        idValidacion: json["idValidacion"],
        descripcion: json["descripcion"],
        idEstado: json["idEstado"],
        descriptionState: json["descriptionState"],
    );
}