class ChatModel {
    ChatModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<ChatMessages> data;
    String message;
    String key;
    int code;

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        data: List<ChatMessages>.from(json["data"].map((x) => ChatMessages.fromJson(x))),
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

class ChatMessages {
    ChatMessages({
        this.id,
        this.room,
        this.message,
        this.sentBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String room;
    String message;
    SentBy sentBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory ChatMessages.fromJson(Map<String, dynamic> json) => ChatMessages(
        id: json["_id"],
        room: json["room"],
        message: json["message"],
        sentBy: SentBy.fromJson(json["sentBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "room": room,
        "message": message,
        "sentBy": sentBy.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class SentBy {
    SentBy({
        this.id,
        this.username,
        this.profilePic,
        this.opinions,
        this.videos,
        this.sentById,
    });

    String id;
    String username;
    String profilePic;
    dynamic opinions;
    dynamic videos;
    String sentById;

    factory SentBy.fromJson(Map<String, dynamic> json) => SentBy(
        id: json["_id"],
        username: json["username"],
        profilePic: json["profilePic"],
        opinions: json["opinions"],
        videos: json["videos"],
        sentById: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "profilePic": profilePic,
        "opinions": opinions,
        "videos": videos,
        "id": sentById,
    };
}
