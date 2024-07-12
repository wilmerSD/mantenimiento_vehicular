class ResponseAllStateRequestModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    List<DatumAllStateRequest>? data;

    ResponseAllStateRequestModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseAllStateRequestModel.fromJson(Map<String, dynamic> json) => ResponseAllStateRequestModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<DatumAllStateRequest>.from(json["data"]!.map((x) => DatumAllStateRequest.fromJson(x))),
    );

}

class DatumAllStateRequest {
    int? idEstadoSolicitud;
    String? descripcion;
    int? idEstado;
    String? descriptionState;
    String? vehiculo;

    DatumAllStateRequest({
        this.idEstadoSolicitud,
        this.descripcion,
        this.idEstado,
        this.descriptionState,
        this.vehiculo,
    });

    factory DatumAllStateRequest.fromJson(Map<String, dynamic> json) => DatumAllStateRequest(
        idEstadoSolicitud: json["idEstadoSolicitud"],
        descripcion: json["descripcion"],
        idEstado: json["idEstado"],
        descriptionState: json["descriptionState"],
        vehiculo: json["vehiculo"],
    );
}