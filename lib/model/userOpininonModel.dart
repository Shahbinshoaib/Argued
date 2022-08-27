class UserOpinion {
    UserOpinion({
        this.data,
        this.code,
    });

    Data data;
    int code;

    factory UserOpinion.fromJson(Map<String, dynamic> json) => UserOpinion(
        data: Data.fromJson(json["data"]),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
    };
}

class Data {
    Data({
        this.opinions,
        this.avgRating,
        this.userDetails,
        this.associatedSubCategory,
    });

    List<Opinion> opinions;
    double avgRating;
    UserDetails userDetails;
    AssociatedSubCategory associatedSubCategory;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        opinions: List<Opinion>.from(json["opinions"].map((x) => Opinion.fromJson(x))),
        avgRating: json["avgRating"].toDouble(),
        userDetails: UserDetails.fromJson(json["userDetails"]),
        associatedSubCategory: AssociatedSubCategory.fromJson(json["associatedSubCategory"]),
    );

    Map<String, dynamic> toJson() => {
        "opinions": List<dynamic>.from(opinions.map((x) => x.toJson())),
        "avgRating": avgRating,
        "userDetails": userDetails.toJson(),
        "associatedSubCategory": associatedSubCategory.toJson(),
    };
}

class AssociatedSubCategory {
    AssociatedSubCategory({
        this.categoryName,
        this.subCategoryName,
    });

    String categoryName;
    String subCategoryName;

    factory AssociatedSubCategory.fromJson(Map<String, dynamic> json) => AssociatedSubCategory(
        categoryName: json["categoryName"],
        subCategoryName: json["subCategoryName"],
    );

    Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "subCategoryName": subCategoryName,
    };
}

class Opinion {
    Opinion({
        this.id,
        this.audience,
        this.rating,
        this.totalRating,
        this.numberOfRatings,
        this.views,
        this.heading,
        this.description,
        this.language,
        this.category,
        this.subCategory,
        this.country,
        this.topic,
        this.video,
        this.createdAt,
        this.updatedAt,
        this.userName,
        this.countryName,
        this.categoryName,
        this.subCategoryName,
    });

    String id;
    String audience;
    double rating;
    double totalRating;
    int numberOfRatings;
    int views;
    String heading;
    String description;
    String language;
    String category;
    String subCategory;
    String country;
    Topic topic;
    Video video;
    DateTime createdAt;
    DateTime updatedAt;
    String userName;
    String countryName;
    String categoryName;
    String subCategoryName;

    factory Opinion.fromJson(Map<String, dynamic> json) => Opinion(
        id: json["_id"],
        audience: json["audience"],
        rating: json["rating"].toDouble(),
        totalRating: json["totalRating"].toDouble(),
        numberOfRatings: json["numberOfRatings"],
        views: json["views"],
        heading: json["heading"],
        description: json["description"],
        language: json["language"],
        category: json["category"],
        subCategory: json["subCategory"],
        country: json["country"],
        topic: Topic.fromJson(json["topic"]),
        video: Video.fromJson(json["video"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userName: json["userName"],
        countryName: json["countryName"],
        categoryName: json["categoryName"],
        subCategoryName: json["subCategoryName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "audience": audience,
        "rating": rating,
        "totalRating": totalRating,
        "numberOfRatings": numberOfRatings,
        "views": views,
        "heading": heading,
        "description": description,
        "language": language,
        "category": category,
        "subCategory": subCategory,
        "country": country,
        "topic": topic.toJson(),
        "video": video.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userName": userName,
        "countryName": countryName,
        "categoryName": categoryName,
        "subCategoryName": subCategoryName,
    };
}

class Topic {
    Topic({
        this.id,
        this.status,
        this.views,
        this.opinionsCount,
        this.description,
        this.name,
        this.createdBy,
        this.category,
        this.subcategory,
        this.country,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String status;
    int views;
    int opinionsCount;
    dynamic description;
    String name;
    String createdBy;
    String category;
    String subcategory;
    String country;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["_id"],
        status: json["status"],
        views: json["views"],
        opinionsCount: json["opinionsCount"],
        description: json["description"],
        name: json["name"],
        createdBy: json["createdBy"],
        category: json["category"],
        subcategory: json["subcategory"],
        country: json["country"],
        details: Details.fromJson(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "views": views,
        "opinionsCount": opinionsCount,
        "description": description,
        "name": name,
        "createdBy": createdBy,
        "category": category,
        "subcategory": subcategory,
        "country": country,
        "details": details.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Details {
    Details({
        this.subCategoryName,
        this.categoryName,
        this.countryName,
        this.userName,
    });

    String subCategoryName;
    String categoryName;
    String countryName;
    String userName;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        subCategoryName: json["subCategoryName"],
        categoryName: json["categoryName"],
        countryName: json["countryName"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "subCategoryName": subCategoryName,
        "categoryName": categoryName,
        "countryName": countryName,
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

class UserDetails {
    UserDetails({
        this.followers,
        this.id,
        this.username,
        this.hostName,
        this.businessWebsite,
        this.businessDetails,
        this.supportedCategories,
        this.aboutUs,
        this.opinions,
        this.videos,
        this.userDetailsId,
    });

    List<String> followers;
    String id;
    String username;
    String hostName;
    List<BusinessWebsite> businessWebsite;
    BusinessDetails businessDetails;
    List<SupportedCategory> supportedCategories;
    String aboutUs;
    dynamic opinions;
    dynamic videos;
    String userDetailsId;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        followers: List<String>.from(json["followers"].map((x) => x)),
        id: json["_id"],
        username: json["username"],
        hostName: json["hostName"],
        businessWebsite: List<BusinessWebsite>.from(json["businessWebsite"].map((x) => BusinessWebsite.fromJson(x))),
        businessDetails: BusinessDetails.fromJson(json["businessDetails"]),
        supportedCategories: List<SupportedCategory>.from(json["supportedCategories"].map((x) => SupportedCategory.fromJson(x))),
        aboutUs: json["aboutUs"],
        opinions: json["opinions"],
        videos: json["videos"],
        userDetailsId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "_id": id,
        "username": username,
        "hostName": hostName,
        "businessWebsite": List<dynamic>.from(businessWebsite.map((x) => x.toJson())),
        "businessDetails": businessDetails.toJson(),
        "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x.toJson())),
        "aboutUs": aboutUs,
        "opinions": opinions,
        "videos": videos,
        "id": userDetailsId,
    };
}

class BusinessDetails {
    BusinessDetails({
        this.id,
        this.subscriptionDate,
        this.name,
        this.registrationNumber,
        this.industry,
        this.tradingName,
        this.employeesCount,
        this.postalAddress,
        this.headOfficeAddress,
    });

    String id;
    DateTime subscriptionDate;
    String name;
    String registrationNumber;
    String industry;
    String tradingName;
    int employeesCount;
    Address postalAddress;
    Address headOfficeAddress;

    factory BusinessDetails.fromJson(Map<String, dynamic> json) => BusinessDetails(
        id: json["_id"],
        subscriptionDate: DateTime.parse(json["subscriptionDate"]),
        name: json["name"],
        registrationNumber: json["registrationNumber"],
        industry: json["industry"],
        tradingName: json["tradingName"],
        employeesCount: json["employeesCount"],
        postalAddress: Address.fromJson(json["postalAddress"]),
        headOfficeAddress: Address.fromJson(json["headOfficeAddress"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "subscriptionDate": subscriptionDate.toIso8601String(),
        "name": name,
        "registrationNumber": registrationNumber,
        "industry": industry,
        "tradingName": tradingName,
        "employeesCount": employeesCount,
        "postalAddress": postalAddress.toJson(),
        "headOfficeAddress": headOfficeAddress.toJson(),
    };
}

class Address {
    Address({
        this.id,
        this.street,
        this.building,
        this.level,
        this.suite,
        this.country,
        this.state,
        this.city,
    });

    String id;
    String street;
    String building;
    String level;
    String suite;
    String country;
    String state;
    String city;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        street: json["street"],
        building: json["building"],
        level: json["level"],
        suite: json["suite"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "street": street,
        "building": building,
        "level": level,
        "suite": suite,
        "country": country,
        "state": state,
        "city": city,
    };
}

class BusinessWebsite {
    BusinessWebsite({
        this.id,
        this.label,
        this.businessWebsite,
    });

    String id;
    String label;
    String businessWebsite;

    factory BusinessWebsite.fromJson(Map<String, dynamic> json) => BusinessWebsite(
        id: json["_id"],
        label: json["label"],
        businessWebsite: json["businessWebsite"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "label": label,
        "businessWebsite": businessWebsite,
    };
}

class SupportedCategory {
    SupportedCategory({
        this.id,
        this.category,
        this.subCategory,
        this.categoryName,
        this.subCategoryName,
    });

    String id;
    String category;
    String subCategory;
    String categoryName;
    String subCategoryName;

    factory SupportedCategory.fromJson(Map<String, dynamic> json) => SupportedCategory(
        id: json["_id"],
        category: json["category"],
        subCategory: json["subCategory"],
        categoryName: json["categoryName"],
        subCategoryName: json["subCategoryName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "subCategory": subCategory,
        "categoryName": categoryName,
        "subCategoryName": subCategoryName,
    };
}