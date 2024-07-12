class ResponseAllStateGeneralModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    List<DatumAllStateGeneral>? data;

    ResponseAllStateGeneralModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseAllStateGeneralModel.fromJson(Map<String, dynamic> json) => ResponseAllStateGeneralModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<DatumAllStateGeneral>.from(json["data"]!.map((x) => DatumAllStateGeneral.fromJson(x))),
    );
}

class DatumAllStateGeneral {
    int? idEstado;
    String? descripcion;

    DatumAllStateGeneral({
        this.idEstado,
        this.descripcion,
    });

    factory DatumAllStateGeneral.fromJson(Map<String, dynamic> json) => DatumAllStateGeneral(
        idEstado: json["IdEstado"],
        descripcion: json["Descripcion"],
    );
}