class RequestUpdateLeaderToUser {
    int? idUser;
    int? idLeader;
    int? id;

    RequestUpdateLeaderToUser({
        this.idUser,
        this.idLeader,
        this.id,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "idLeader": idLeader,
        "id": id,
    };
}