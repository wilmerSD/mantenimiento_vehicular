class RequestOfAllWorkersModel {
    int? typeRequest;
    String? filterName;
    String? filterCip;
    String? filterDni;
    int? stateInProgress;
    int? stateApprovedByLeader;
    int? stateRejectedByLeader;
    int? stateInProgressRrhh;
    int? stateAprovedByRrhh;
    int? stateRejectedByRrhh;
    int? page;
    String? idUser;

    RequestOfAllWorkersModel({
        this.typeRequest,
        this.filterName,
        this.filterCip,
        this.filterDni,
        this.stateInProgress,
        this.stateApprovedByLeader,
        this.stateRejectedByLeader,
        this.stateInProgressRrhh,
        this.stateAprovedByRrhh,
        this.stateRejectedByRrhh,
        this.page,
        this.idUser,
    });

    Map<String, dynamic> toMap() => {
        "typeRequest": typeRequest,
        "filterName": filterName,
        "filterCIP": filterCip,
        "filterDNI": filterDni,
        "stateInProgress": stateInProgress,
        "stateApprovedByLeader": stateApprovedByLeader,
        "stateRejectedByLeader": stateRejectedByLeader,
        "stateInProgressRRHH": stateInProgressRrhh,
        "stateAprovedByRRHH": stateAprovedByRrhh,
        "stateRejectedByRRHH": stateRejectedByRrhh,
        "page": page,
        "idUser": idUser,
    };
}