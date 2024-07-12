class ResponseAllTypeMarkingModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    List<DatumAllTypeMarking>? data;

    ResponseAllTypeMarkingModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseAllTypeMarkingModel.fromJson(Map<String, dynamic> json) => ResponseAllTypeMarkingModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<DatumAllTypeMarking>.from(json["data"]!.map((x) => DatumAllTypeMarking.fromJson(x))),
    );

}

class DatumAllTypeMarking {
    int? idTMarcaciones;
    String? descripcion;
    int? idEstado;
    String? descriptionState;

    DatumAllTypeMarking({
        this.idTMarcaciones,
        this.descripcion,
        this.idEstado,
        this.descriptionState,
    });

    factory DatumAllTypeMarking.fromJson(Map<String, dynamic> json) => DatumAllTypeMarking(
        idTMarcaciones: json["idTMarcaciones"],
        descripcion: json["descripcion"],
        idEstado: json["IdEstado"],
        descriptionState: json["descriptionState"],
    );

}