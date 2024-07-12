class ResponseMaintainersModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    String? data;

    ResponseMaintainersModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseMaintainersModel.fromJson(Map<String, dynamic> json) => ResponseMaintainersModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
    );
}
