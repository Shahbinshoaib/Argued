class FindContactModel {
    FindContactModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory FindContactModel.fromJson(Map<String, dynamic> json) => FindContactModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        key: json["key"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "key": key,
        "code": code,
    };
}

class Datum {
    Datum({
        this.id,
        this.username,
        this.profilePic,
        this.opinions,
        this.videos,
        this.datumId,
    });

    String id;
    String username;
    String profilePic;
    dynamic opinions;
    dynamic videos;
    String datumId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        username: json["username"],
        profilePic: json["profilePic"],
        opinions: json["opinions"],
        videos: json["videos"],
        datumId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "profilePic": profilePic,
        "opinions": opinions,
        "videos": videos,
        "id": datumId,
    };
}
