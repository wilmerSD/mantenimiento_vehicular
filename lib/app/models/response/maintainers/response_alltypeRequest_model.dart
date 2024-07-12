class ResponseAllTypeRequest {
    bool success;
    int? statusCode;
    String? statusMessage;
    List<DatumAllTypeRequest>? data;

    ResponseAllTypeRequest({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseAllTypeRequest.fromJson(Map<String, dynamic> json) => ResponseAllTypeRequest(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<DatumAllTypeRequest>.from(json["data"]!.map((x) => DatumAllTypeRequest.fromJson(x))),
    );
}

class DatumAllTypeRequest {
    int? idSolicitud;
    String? descripcion;
    int? idEstado;
    String? descriptionState;

    DatumAllTypeRequest({
        this.idSolicitud,
        this.descripcion,
        this.idEstado,
        this.descriptionState,  
    });

    factory DatumAllTypeRequest.fromJson(Map<String, dynamic> json) => DatumAllTypeRequest(
        idSolicitud: json["idSolicitud"],
        descripcion: json["descripcion"],
        idEstado: json["idEstado"],
        descriptionState: json["descriptionState"],
    );

}