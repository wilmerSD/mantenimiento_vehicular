class RequestRequestAsignedToLeader {
    int? idLeader;
    String? filterName;
    String? filterCip;
    String? filterDni;
    int? typeRequest;
    int? stateInProgress;
    int? stateApprovedByLeader;
    int? stateRejectedByLeader;
    int? stateInProgressRrhh;
    int? stateAprovedByRrhh;
    int? stateRejectedByRrhh;
    int? page;
    String? idUser;

    RequestRequestAsignedToLeader({
        this.idLeader,
        this.filterName,
        this.filterCip,
        this.filterDni,
        this.typeRequest,
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
        "idLeader": idLeader,
        "filterName": filterName,
        "filterCIP": filterCip,
        "filterDNI": filterDni,
        "typeRequest": typeRequest,
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