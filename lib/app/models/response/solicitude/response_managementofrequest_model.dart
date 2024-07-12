class ResponseManagementOfRequestModel {
    bool? success;
    int? statusCode;
    String? statusMessage;
    String? data;

    ResponseManagementOfRequestModel({
        this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseManagementOfRequestModel.fromJson(Map<String, dynamic> json) => ResponseManagementOfRequestModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
    );

}
