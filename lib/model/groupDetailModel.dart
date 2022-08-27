class GroupDetailsModel {
    GroupDetailsModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory GroupDetailsModel.fromJson(Map<String, dynamic> json) => GroupDetailsModel(
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
        this.profilePic,
        this.createdAt,
        this.updatedAt,
        this.categoryName,
        this.subCategoryName,
        this.userName,
        this.countryName,
        this.stateName,
        this.cityName,
        this.isAdmin,
        this.isCreator,
        this.lastRead,
        this.topicRelevance,
        this.numberOfMembers,
        this.geoLocationRelevance,
        this.lastMessage,
        this.lastMessageMobile,
        this.unreadCount,
    });

    String id;
    String audience;
    String status;
    String name;
    String description;
    CreatedBy createdBy;
    List<Member> members;
    String profilePic;
    DateTime createdAt;
    DateTime updatedAt;
    String categoryName;
    String subCategoryName;
    String userName;
    String countryName;
    String stateName;
    String cityName;
    bool isAdmin;
    bool isCreator;
    DateTime lastRead;
    String topicRelevance;
    int numberOfMembers;
    String geoLocationRelevance;
    LastMessage lastMessage;
    DateTime lastMessageMobile;
    int unreadCount;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        audience: json["audience"],
        status: json["status"],
        name: json["name"],
        description: json["description"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        profilePic: json["profilePic"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryName: json["categoryName"],
        subCategoryName: json["subCategoryName"],
        userName: json["userName"],
        countryName: json["countryName"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        isAdmin: json["isAdmin"],
        isCreator: json["isCreator"],
        lastRead: DateTime.parse(json["lastRead"]),
        topicRelevance: json["topicRelevance"],
        numberOfMembers: json["numberOfMembers"],
        geoLocationRelevance: json["geoLocationRelevance"],
        lastMessage: LastMessage.fromJson(json["lastMessage"]),
        lastMessageMobile: DateTime.parse(json["lastMessageMobile"]),
        unreadCount: json["unreadCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "audience": audience,
        "status": status,
        "name": name,
        "description": description,
        "createdBy": createdBy.toJson(),
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "profilePic": profilePic,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categoryName": categoryName,
        "subCategoryName": subCategoryName,
        "userName": userName,
        "countryName": countryName,
        "stateName": stateName,
        "cityName": cityName,
        "isAdmin": isAdmin,
        "isCreator": isCreator,
        "lastRead": lastRead.toIso8601String(),
        "topicRelevance": topicRelevance,
        "numberOfMembers": numberOfMembers,
        "geoLocationRelevance": geoLocationRelevance,
        "lastMessage": lastMessage.toJson(),
        "lastMessageMobile": lastMessageMobile.toIso8601String(),
        "unreadCount": unreadCount,
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
    String sentBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"],
        group: json["group"],
        message: json["message"],
        sentBy: json["sentBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "group": group,
        "message": message,
        "sentBy": sentBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Member {
    Member({
        this.admin,
        this.blocked,
        this.id,
        this.adminDate,
        this.createdAt,
        this.updatedAt,
        this.userDetails,
        this.lastMessage,
        this.lastRead,
    });

    bool admin;
    bool blocked;
    String id;
    DateTime adminDate;
    DateTime createdAt;
    DateTime updatedAt;
    UserDetails userDetails;
    LastMessage lastMessage;
    DateTime lastRead;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        admin: json["admin"],
        blocked: json["blocked"],
        id: json["_id"],
        adminDate: json["adminDate"] == null ? null : DateTime.parse(json["adminDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userDetails: UserDetails.fromJson(json["userDetails"]),
        lastMessage: json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
        lastRead: json["lastRead"] == null ? null : DateTime.parse(json["lastRead"]),
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "blocked": blocked,
        "_id": id,
        "adminDate": adminDate == null ? null : adminDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userDetails": userDetails.toJson(),
        "lastMessage": lastMessage == null ? null : lastMessage.toJson(),
        "lastRead": lastRead == null ? null : lastRead.toIso8601String(),
    };
}

class UserDetails {
    UserDetails({
        this.id,
        this.username,
        this.opinions,
        this.videos,
        this.userDetailsId,
    });

    String id;
    String username;
    dynamic opinions;
    dynamic videos;
    String userDetailsId;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        username: json["username"],
        opinions: json["opinions"],
        videos: json["videos"],
        userDetailsId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "opinions": opinions,
        "videos": videos,
        "id": userDetailsId,
    };
}
