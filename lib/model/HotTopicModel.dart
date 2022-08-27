// class HotTopicModel {
//     HotTopicModel({
//         this.id,
//         this.audience,
//         this.rating,
//         this.totalRating,
//         this.numberOfRatings,
//         this.views,
//         this.deleted,
//         this.requestEngagement,
//         this.topic,
//         this.heading,
//         this.category,
//         this.subCategory,
//         this.description,
//         this.userPostCover,
//         this.stand,
//         this.country,
//         this.language,
//         this.createdBy,
//         this.video,
//         this.details,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.opinionViews,
//         this.viewCount,
//     });

//     String id;
//     String audience;
//     int rating;
//     int totalRating;
//     int numberOfRatings;
//     int views;
//     bool deleted;
//     bool requestEngagement;
//     String topic;
//     String heading;
//     String category;
//     String subCategory;
//     String description;
//     String userPostCover;
//     String stand;
//     String country;
//     String language;
//     String createdBy;
//     Video video;
//     Details details;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     List<dynamic> opinionViews;
//     int viewCount;

//     factory HotTopicModel.fromJson(Map<String, dynamic> json) => HotTopicModel(
//         id: json["_id"],
//         audience: json["audience"],
//         rating: json["rating"],
//         totalRating: json["totalRating"],
//         numberOfRatings: json["numberOfRatings"],
//         views: json["views"],
//         deleted: json["deleted"],
//         requestEngagement: json["requestEngagement"],
//         topic: json["topic"],
//         heading: json["heading"],
//         category: json["category"],
//         subCategory: json["subCategory"],
//         description: json["description"],
//         userPostCover: json["userPostCover"],
//         stand: json["stand"],
//         country: json["country"],
//         language: json["language"],
//         createdBy: json["createdBy"],
//         video: Video.fromJson(json["video"]),
//         details: Details.fromJson(json["details"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         opinionViews: List<dynamic>.from(json["opinion-views"].map((x) => x)),
//         viewCount: json["viewCount"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "audience": audience,
//         "rating": rating,
//         "totalRating": totalRating,
//         "numberOfRatings": numberOfRatings,
//         "views": views,
//         "deleted": deleted,
//         "requestEngagement": requestEngagement,
//         "topic": topic,
//         "heading": heading,
//         "category": category,
//         "subCategory": subCategory,
//         "description": description,
//         "userPostCover": userPostCover,
//         "stand": stand,
//         "country": country,
//         "language": language,
//         "createdBy": createdBy,
//         "video": video.toJson(),
//         "details": details.toJson(),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "opinion-views": List<dynamic>.from(opinionViews.map((x) => x)),
//         "viewCount": viewCount,
//     };
// }

// class Details {
//     Details({
//         this.subCategoryName,
//         this.categoryName,
//         this.countryName,
//         this.topicName,
//         this.userName,
//     });

//     String subCategoryName;
//     String categoryName;
//     String countryName;
//     String topicName;
//     String userName;

//     factory Details.fromJson(Map<String, dynamic> json) => Details(
//         subCategoryName: json["subCategoryName"],
//         categoryName: json["categoryName"],
//         countryName: json["countryName"],
//         topicName: json["topicName"],
//         userName: json["userName"],
//     );

//     Map<String, dynamic> toJson() => {
//         "subCategoryName": subCategoryName,
//         "categoryName": categoryName,
//         "countryName": countryName,
//         "topicName": topicName,
//         "userName": userName,
//     };
// }

// class Video {
//     Video({
//         this.id,
//         this.used,
//         this.deleted,
//         this.uploading,
//         this.createdBy,
//         this.name,
//         this.size,
//         this.file,
//         this.mimetype,
//         this.thumbnail,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.duration,
//     });

//     String id;
//     bool used;
//     bool deleted;
//     bool uploading;
//     String createdBy;
//     String name;
//     int size;
//     String file;
//     String mimetype;
//     String thumbnail;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     int duration;

//     factory Video.fromJson(Map<String, dynamic> json) => Video(
//         id: json["_id"],
//         used: json["used"],
//         deleted: json["deleted"],
//         uploading: json["uploading"],
//         createdBy: json["createdBy"],
//         name: json["name"],
//         size: json["size"],
//         file: json["file"],
//         mimetype: json["mimetype"],
//         thumbnail: json["thumbnail"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         duration: json["duration"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "used": used,
//         "deleted": deleted,
//         "uploading": uploading,
//         "createdBy": createdBy,
//         "name": name,
//         "size": size,
//         "file": file,
//         "mimetype": mimetype,
//         "thumbnail": thumbnail,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "duration": duration,
//     };
// }


class HotTopicModel {
    HotTopicModel({
        this.id,
        this.audience,
        this.rating,
        this.totalRating,
        this.numberOfRatings,
        this.views,
        this.deleted,
        this.requestEngagement,
        this.country,
        this.heading,
        this.category,
        this.subCategory,
        this.description,
        this.source,
        this.stand,
        this.language,
        this.createdBy,
        this.topic,
        this.video,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.opinionViews,
        this.viewCount,
    });

    String id;
    String audience;
    int rating;
    int totalRating;
    int numberOfRatings;
    int views;
    bool deleted;
    bool requestEngagement;
    String country;
    String heading;
    String category;
    String subCategory;
    String description;
    String source;
    String stand;
    String language;
    CreatedBy createdBy;
    String topic;
    Video video;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<dynamic> opinionViews;
    int viewCount;

    factory HotTopicModel.fromJson(Map<String, dynamic> json) => HotTopicModel(
        id: json["_id"],
        audience: json["audience"],
        rating: json["rating"],
        totalRating: json["totalRating"],
        numberOfRatings: json["numberOfRatings"],
        views: json["views"],
        deleted: json["deleted"],
        requestEngagement: json["requestEngagement"],
        country: json["country"],
        heading: json["heading"],
        category: json["category"],
        subCategory: json["subCategory"],
        description: json["description"],
        source: json["Source"],
        stand: json["stand"],
        language: json["language"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        topic: json["topic"],
        video: Video.fromJson(json["video"]),
        details: Details.fromJson(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        opinionViews: List<dynamic>.from(json["opinion-views"].map((x) => x)),
        viewCount: json["viewCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "audience": audience,
        "rating": rating,
        "totalRating": totalRating,
        "numberOfRatings": numberOfRatings,
        "views": views,
        "deleted": deleted,
        "requestEngagement": requestEngagement,
        "country": country,
        "heading": heading,
        "category": category,
        "subCategory": subCategory,
        "description": description,
        "Source": source,
        "stand": stand,
        "language": language,
        "createdBy": createdBy.toJson(),
        "topic": topic,
        "video": video.toJson(),
        "details": details.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "opinion-views": List<dynamic>.from(opinionViews.map((x) => x)),
        "viewCount": viewCount,
    };
}

class CreatedBy {
    CreatedBy({
        this.id,
        this.username,
        this.profilePic,
        this.displayName,
        this.opinions,
        this.videos,
        this.createdById,
    });

    String id;
    String username;
    String profilePic;
    String displayName;
    dynamic opinions;
    dynamic videos;
    String createdById;

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        username: json["username"],
        profilePic: json["profilePic"],
        displayName: json["displayName"],
        opinions: json["opinions"],
        videos: json["videos"],
        createdById: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "profilePic": profilePic,
        "displayName": displayName,
        "opinions": opinions,
        "videos": videos,
        "id": createdById,
    };
}

class Details {
    Details({
        this.subCategoryName,
        this.categoryName,
        this.countryName,
        this.topicName,
        this.userName,
    });

    String subCategoryName;
    String categoryName;
    String countryName;
    String topicName;
    String userName;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        subCategoryName: json["subCategoryName"],
        categoryName: json["categoryName"],
        countryName: json["countryName"],
        topicName: json["topicName"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "subCategoryName": subCategoryName,
        "categoryName": categoryName,
        "countryName": countryName,
        "topicName": topicName,
        "userName": userName,
    };
}

class Video {
    Video({
        this.id,
        this.used,
        this.deleted,
        this.uploading,
        this.createdBy,
        this.name,
        this.size,
        this.file,
        this.mimetype,
        this.thumbnail,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.duration,
    });

    String id;
    bool used;
    bool deleted;
    bool uploading;
    String createdBy;
    String name;
    int size;
    String file;
    String mimetype;
    String thumbnail;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    int duration;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["_id"],
        used: json["used"],
        deleted: json["deleted"],
        uploading: json["uploading"],
        createdBy: json["createdBy"],
        name: json["name"],
        size: json["size"],
        file: json["file"],
        mimetype: json["mimetype"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "used": used,
        "deleted": deleted,
        "uploading": uploading,
        "createdBy": createdBy,
        "name": name,
        "size": size,
        "file": file,
        "mimetype": mimetype,
        "thumbnail": thumbnail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "duration": duration,
    };
}
