class GroupModel {
    GroupModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
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
        this.audience,
        this.status,
        this.name,
        this.description,
        this.createdBy,
        this.members,
        this.createdAt,
        this.updatedAt,
        this.categoryName,
        this.subCategoryName,
        this.userName,
        this.approvedByName,
        this.countryName,
        this.isAdmin,
        this.isCreator,
        this.lastRead,
        this.topicRelevance,
        this.numberOfMembers,
        this.geoLocationRelevance,
        this.stateName,
        this.cityName,
        this.lastMessage,
        this.lastMessageMobile,
        this.unreadCount,
        this.profilePic,
        this.nominations,
        this.joinRequests,
    });

    String id;
    String audience;
    String status;
    String name;
    String description;
    CreatedBy createdBy;
    List<Member> members;
    DateTime createdAt;
    DateTime updatedAt;
    String categoryName;
    String subCategoryName;
    String userName;
    String approvedByName;
    String countryName;
    bool isAdmin;
    bool isCreator;
    String lastRead;
    String topicRelevance;
    int numberOfMembers;
    String geoLocationRelevance;
    String stateName;
    String cityName;
    LastMessage lastMessage;
    LastMessage lastMessageMobile;
    int unreadCount;
    String profilePic;
    List<dynamic> nominations;
    List<dynamic> joinRequests;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        audience: json["audience"],
        status: json["status"],
        name: json["name"],
        description: json["description"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryName: json["categoryName"],
        subCategoryName: json["subCategoryName"],
        userName: json["userName"],
        approvedByName: json["approvedByName"] == null ? null : json["approvedByName"],
        countryName: json["countryName"],
        isAdmin: json["isAdmin"],
        isCreator: json["isCreator"],
        lastRead: json["lastRead"],
        topicRelevance: json["topicRelevance"],
        numberOfMembers: json["numberOfMembers"],
        geoLocationRelevance: json["geoLocationRelevance"],
        stateName: json["stateName"] == null ? null : json["stateName"],
        cityName: json["cityName"] == null ? null : json["cityName"],
        lastMessage: json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
        lastMessageMobile: LastMessage.fromJson(json["lastMessageMobile"]),
        unreadCount: json["unreadCount"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        nominations: json["nominations"] == null ? null : List<dynamic>.from(json["nominations"].map((x) => x)),
        joinRequests: json["joinRequests"] == null ? null : List<dynamic>.from(json["joinRequests"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "audience": audience,
        "status": status,
        "name": name,
        "description": description,
        "createdBy": createdBy.toJson(),
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categoryName": categoryName,
        "subCategoryName": subCategoryName,
        "userName": userName,
        "approvedByName": approvedByName == null ? null : approvedByName,
        "countryName": countryName,
        "isAdmin": isAdmin,
        "isCreator": isCreator,
        "lastRead": lastRead,
        "topicRelevance": topicRelevance,
        "numberOfMembers": numberOfMembers,
        "geoLocationRelevance": geoLocationRelevance,
        "stateName": stateName == null ? null : stateName,
        "cityName": cityName == null ? null : cityName,
        "lastMessage": lastMessage == null ? null : lastMessage.toJson(),
        "lastMessageMobile": lastMessageMobile.toJson(),
        "unreadCount": unreadCount,
        "profilePic": profilePic == null ? null : profilePic,
        "nominations": nominations == null ? null : List<dynamic>.from(nominations.map((x) => x)),
        "joinRequests": joinRequests == null ? null : List<dynamic>.from(joinRequests.map((x) => x)),
    };
}

class CreatedBy {
    CreatedBy({
        this.id,
        this.username,
    });

    String id;
    String username;

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
    };
}

class LastMessage {
    LastMessage({
        this.id,
        this.group,
        this.message,
        this.sentBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String group;
    String message;
    SentBy sentBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"] == null ? null : json["_id"],
        group: json["group"] == null ? null : json["group"],
        message: json["message"] == null ? null : json["message"],
        sentBy: json["sentBy"] == null ? null : sentByValues.map[json["sentBy"]],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "group": group == null ? null : group,
        "message": message == null ? null : message,
        "sentBy": sentBy == null ? null : sentByValues.reverse[sentBy],
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
    };
}

enum SentBy { THE_5_F5_ADE7_CE590_B141_D2_F3_C7_C9, THE_5_DE4_D6_CF26_D43127_CA9_A46_E6 }

final sentByValues = EnumValues({
    "5de4d6cf26d43127ca9a46e6": SentBy.THE_5_DE4_D6_CF26_D43127_CA9_A46_E6,
    "5f5ade7ce590b141d2f3c7c9": SentBy.THE_5_F5_ADE7_CE590_B141_D2_F3_C7_C9
});

class Member {
    Member({
        this.admin,
        this.blocked,
        this.id,
        this.adminDate,
        this.createdAt,
        this.updatedAt,
        this.lastRead,
    });

    bool admin;
    bool blocked;
    String id;
    DateTime adminDate;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime lastRead;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        admin: json["admin"],
        blocked: json["blocked"],
        id: json["_id"],
        adminDate: json["adminDate"] == null ? null : DateTime.parse(json["adminDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        lastRead: json["lastRead"] == null ? null : DateTime.parse(json["lastRead"]),
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "blocked": blocked,
        "_id": id,
        "adminDate": adminDate == null ? null : adminDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "lastRead": lastRead == null ? null : lastRead.toIso8601String(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
