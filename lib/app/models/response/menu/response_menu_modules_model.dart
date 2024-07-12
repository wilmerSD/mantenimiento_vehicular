class ResponseMenuModulesModel {
    List<Datum>? data;
    int? count;
    int? pageCount;
    int? pageIndex;
    int? pageSize;

    ResponseMenuModulesModel({
     this.data,
     this.count,
     this.pageCount,
     this.pageIndex,
     this.pageSize,
    });

    factory ResponseMenuModulesModel.fromJson(Map<String, dynamic> json) => ResponseMenuModulesModel(
        //data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        count: json["count"],
        pageCount: json["pageCount"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
    );

}

class Datum {
    int? iidOpcion;
    String? vtituloModule;
    String? vtituloOpcion;

    Datum({
      this.iidOpcion,
      this.vtituloModule,
      this.vtituloOpcion,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        iidOpcion: json["iid_opcion"],
        vtituloModule: json["vtitulo_module"],
        vtituloOpcion: json["vtitulo_opcion"],
    );

}