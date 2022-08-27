
class OpinionModel {
    OpinionModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<OpinionData> data;
    String message;
    String key;
    int code;

    factory OpinionModel.fromMap(Map<String, dynamic> json) => OpinionModel(
        data: List<OpinionData>.from(json["data"].map((x) => OpinionData.fromMap(x))),
        message: json["message"],
        key: json["key"],
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "message": message,
        "key": key,
        "code": code,
    };
}

class OpinionData {
    OpinionData({
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
        this.stand,
        this.language,
        this.createdBy,
        this.topic,
        this.video,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.userRatings,
        this.subcatName,
        this.state,
        this.city,
    });

    String id;
    String audience;
    String rating;
    String totalRating;
    int numberOfRatings;
    int views;
    bool deleted;
    bool requestEngagement;
    Country country;
    String heading;
    Category category;
    String subCategory;
    String stand;
    String language;
    CreatedBy createdBy;
    Topic topic;
    DatumVideo video;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<UserRating> userRatings;
    String subcatName;
    String state;
    String city;

    factory OpinionData.fromMap(Map<String, dynamic> json) => OpinionData(
        id: json["_id"],
        audience: json["audience"],
        rating: json["rating"] != null? json["rating"].toString() : '0',
        totalRating: json["totalRating"] != null ? json["totalRating"].toString() : '0',
        numberOfRatings: json["numberOfRatings"],
        views: json["views"],
        deleted: json["deleted"],
        requestEngagement: json["requestEngagement"],
        country: Country.fromMap(json["country"]),
        heading: json["heading"],
        category: Category.fromMap(json["category"]),
        subCategory: json["subCategory"],
        stand: json["stand"],
        language: json["language"],
        createdBy: CreatedBy.fromMap(json["createdBy"]),
        topic: Topic.fromMap(json["topic"]),
        video: DatumVideo.fromMap(json["video"]),
        details: Details.fromMap(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userRatings: List<UserRating>.from(json["userRatings"].map((x) => UserRating.fromMap(x))),
        subcatName: json["subcatName"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "audience": audience,
        "rating": rating,
        "totalRating": totalRating,
        "numberOfRatings": numberOfRatings,
        "views": views,
        "deleted": deleted,
        "requestEngagement": requestEngagement,
        "country": country.toMap(),
        "heading": heading,
        "category": category.toMap(),
        "subCategory": subCategory,
        "stand": stand,
        "language": language,
        "createdBy": createdBy.toMap(),
        "topic": topic.toMap(),
        "video": video.toMap(),
        "details": details.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "userRatings": List<dynamic>.from(userRatings.map((x) => x.toMap())),
        "subcatName": subcatName,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
    };
}

class Category {
    Category({
        this.id,
        this.status,
        this.tags,
        this.name,
        this.subcategories,
        this.v,
        this.profilePic,
    });

    String id;
    Status status;
    List<dynamic> tags;
    String name;
    List<Subcategory> subcategories;
    int v;
    String profilePic;

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        status: statusValues.map[json["status"]],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        name: json["name"],
        subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromMap(x))),
        v: json["__v"],
        profilePic: json["profilePic"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "status": statusValues.reverse[status],
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "name": name,
        "subcategories": List<dynamic>.from(subcategories.map((x) => x.toMap())),
        "__v": v,
        "profilePic": profilePic,
    };
}

enum Status { APPROVED }

final statusValues = EnumValues({
    "Approved": Status.APPROVED
});

class Subcategory {
    Subcategory({
        this.status,
        this.tags,
        this.id,
        this.name,
        this.profilePic,
    });

    Status status;
    List<String> tags;
    String id;
    String name;
    String profilePic;

    factory Subcategory.fromMap(Map<String, dynamic> json) => Subcategory(
        status: statusValues.map[json["status"]],
        tags: List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
    );

    Map<String, dynamic> toMap() => {
        "status": statusValues.reverse[status],
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "_id": id,
        "name": name,
        "profilePic": profilePic == null ? null : profilePic,
    };
}

class Country {
    Country({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory Country.fromMap(Map<String, dynamic> json) => Country(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
    };
}

class CreatedBy {
    CreatedBy({
        this.id,
        this.verified,
        this.activityScore,
        this.username,
        this.level,
        this.completion,
        this.profilePic,
        this.displayName,
    });

    String id;
    bool verified;
    double activityScore;
    String username;
    String level;
    Completion completion;
    String profilePic;
    String displayName;

    factory CreatedBy.fromMap(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        verified: json["verified"],
        activityScore: json["activityScore"].toDouble(),
        username: json["username"],
        level: json["level"],
        completion: Completion.fromMap(json["completion"]),
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        displayName: json["displayName"] == null ? null : json["displayName"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "verified": verified,
        "activityScore": activityScore,
        "username": username,
        "level": level,
        "completion": completion.toMap(),
        "profilePic": profilePic == null ? null : profilePic,
        "displayName": displayName == null ? null : displayName,
    };
}

class Completion {
    Completion({
        this.percentage,
        this.title,
    });

    int percentage;
    String title;

    factory Completion.fromMap(Map<String, dynamic> json) => Completion(
        percentage: json["percentage"],
        title: json["title"],
    );

    Map<String, dynamic> toMap() => {
        "percentage": percentage,
        "title": title,
    };
}

class Details {
    Details({
        this.subCategoryName,
        this.categoryName,
        this.countryName,
        this.topicName,
        this.userName,
        this.stateName,
        this.cityName,
    });

    String subCategoryName;
    String categoryName;
    String countryName;
    String topicName;
    String userName;
    String stateName;
    String cityName;

    factory Details.fromMap(Map<String, dynamic> json) => Details(
        subCategoryName: json["subCategoryName"],
        categoryName: json["categoryName"],
        countryName: json["countryName"],
        topicName: json["topicName"] == null ? null : json["topicName"],
        userName: json["userName"],
        stateName: json["stateName"] == null ? null : json["stateName"],
        cityName: json["cityName"] == null ? null : json["cityName"],
    );

    Map<String, dynamic> toMap() => {
        "subCategoryName": subCategoryName,
        "categoryName": categoryName,
        "countryName": countryName,
        "topicName": topicName == null ? null : topicName,
        "userName": userName,
        "stateName": stateName == null ? null : stateName,
        "cityName": cityName == null ? null : cityName,
    };
}

class Topic {
    Topic({
        this.id,
        this.status,
        this.views,
        this.opinionsCount,
        this.country,
        this.name,
        this.category,
        this.createdBy,
        this.subcategory,
        this.description,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.opinions,
        this.stand,
        this.createdByName,
        this.state,
        this.city,
    });

    String id;
    Status status;
    int views;
    int opinionsCount;
    String country;
    String name;
    String category;
    PurpleCreatedBy createdBy;
    String subcategory;
    dynamic description;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<Opinion> opinions;
    List<Stand> stand;
    CreatedBy createdByName;
    String state;
    String city;

    factory Topic.fromMap(Map<String, dynamic> json) => Topic(
        id: json["_id"],
        status: statusValues.map[json["status"]],
        views: json["views"],
        opinionsCount: json["opinionsCount"],
        country: json["country"],
        name: json["name"],
        category: json["category"],
        createdBy: PurpleCreatedBy.fromMap(json["createdBy"]),
        subcategory: json["subcategory"],
        description: json["description"],
        details: Details.fromMap(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        opinions: List<Opinion>.from(json["opinions"].map((x) => Opinion.fromMap(x))),
        stand: List<Stand>.from(json["stand"].map((x) => Stand.fromMap(x))),
        createdByName: CreatedBy.fromMap(json["createdByName"]),
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "status": statusValues.reverse[status],
        "views": views,
        "opinionsCount": opinionsCount,
        "country": country,
        "name": name,
        "category": category,
        "createdBy": createdBy.toMap(),
        "subcategory": subcategory,
        "description": description,
        "details": details.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "opinions": List<dynamic>.from(opinions.map((x) => x.toMap())),
        "stand": List<dynamic>.from(stand.map((x) => x.toMap())),
        "createdByName": createdByName.toMap(),
        "state": state == null ? null : state,
        "city": city == null ? null : city,
    };
}

class PurpleCreatedBy {
    PurpleCreatedBy({
        this.id,
        this.settings,
        this.verified,
        this.agreeTerms,
        this.languagesSpoken,
        this.followers,
        this.following,
        this.topicOfInterests,
        this.subCategories,
        this.countriesFollowing,
        this.statesFollowing,
        this.citiesFollowing,
        this.storage,
        this.countriesToShow,
        this.activityScore,
        this.username,
        this.role,
        this.email,
        this.plan,
        this.level,
        this.confirmId,
        this.contacts,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.completion,
        this.activityMovement,
        this.lastLogin,
        this.countryOfResidence,
        this.currency,
        this.displayLanguage,
        this.dob,
        this.firstname,
        this.geoPreference,
        this.income,
        this.lastname,
        this.maritalStatus,
        this.nationality,
        this.profilePic,
        this.religion,
        this.salutation,
        this.gender,
        this.subscription,
        this.displayName,
        this.paid,
        this.supportedCategories,
        this.businessWebsite,
        this.keywordsToWatch,
        this.auto,
        this.occupation,
    });

    String id;
    Settings settings;
    bool verified;
    bool agreeTerms;
    List<String> languagesSpoken;
    List<String> followers;
    List<String> following;
    List<String> topicOfInterests;
    List<String> subCategories;
    List<dynamic> countriesFollowing;
    List<dynamic> statesFollowing;
    List<dynamic> citiesFollowing;
    int storage;
    List<String> countriesToShow;
    double activityScore;
    String username;
    String role;
    String email;
    String plan;
    String level;
    String confirmId;
    List<Contact> contacts;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    Completion completion;
    String activityMovement;
    DateTime lastLogin;
    String countryOfResidence;
    String currency;
    String displayLanguage;
    DateTime dob;
    String firstname;
    GeoPreference geoPreference;
    dynamic income;
    String lastname;
    String maritalStatus;
    String nationality;
    String profilePic;
    String religion;
    String salutation;
    String gender;
    bool subscription;
    String displayName;
    bool paid;
    List<dynamic> supportedCategories;
    List<dynamic> businessWebsite;
    List<dynamic> keywordsToWatch;
    bool auto;
    String occupation;

    factory PurpleCreatedBy.fromMap(Map<String, dynamic> json) => PurpleCreatedBy(
        id: json["_id"],
        settings: Settings.fromMap(json["settings"]),
        verified: json["verified"],
        agreeTerms: json["agreeTerms"],
        languagesSpoken: List<String>.from(json["languagesSpoken"].map((x) => x)),
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        topicOfInterests: List<String>.from(json["topicOfInterests"].map((x) => x)),
        subCategories: List<String>.from(json["subCategories"].map((x) => x)),
        countriesFollowing: List<dynamic>.from(json["countriesFollowing"].map((x) => x)),
        statesFollowing: List<dynamic>.from(json["statesFollowing"].map((x) => x)),
        citiesFollowing: List<dynamic>.from(json["citiesFollowing"].map((x) => x)),
        storage: json["storage"],
        countriesToShow: List<String>.from(json["countriesToShow"].map((x) => x)),
        activityScore: json["activityScore"].toDouble(),
        username: json["username"],
        role: json["role"],
        email: json["email"],
        plan: json["plan"],
        level: json["level"],
        confirmId: json["confirmId"],
        contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromMap(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        completion: Completion.fromMap(json["completion"]),
        activityMovement: json["activityMovement"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        countryOfResidence: json["countryOfResidence"],
        currency: json["currency"],
        displayLanguage: json["displayLanguage"],
        dob:(json["dob"])!=null? DateTime.parse(json["dob"]):DateTime.now(),
        firstname: json["firstname"],
        geoPreference: json["geoPreference"] == null ? null : GeoPreference.fromMap(json["geoPreference"]),
        income: json["income"],
        lastname: json["lastname"],
        maritalStatus: json["maritalStatus"],
        nationality: json["nationality"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        religion: json["religion"],
        salutation: json["salutation"],
        gender: json["gender"],
        subscription: json["subscription"],
        displayName: json["displayName"],
        paid: json["paid"],
        supportedCategories:json["supportedCategories"] !=null? List<dynamic>.from(json["supportedCategories"].map((x) => x)):List(),
        businessWebsite: json["businessWebsite"] == null ? null : List<dynamic>.from(json["businessWebsite"].map((x) => x)),
        keywordsToWatch: json["keywordsToWatch"] == null ? null : List<dynamic>.from(json["keywordsToWatch"].map((x) => x)),
        auto: json["auto"] == null ? null : json["auto"],
        occupation: json["occupation"] == null ? null : json["occupation"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "settings": settings.toMap(),
        "verified": verified,
        "agreeTerms": agreeTerms,
        "languagesSpoken": List<dynamic>.from(languagesSpoken.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "topicOfInterests": List<dynamic>.from(topicOfInterests.map((x) => x)),
        "subCategories": List<dynamic>.from(subCategories.map((x) => x)),
        "countriesFollowing": List<dynamic>.from(countriesFollowing.map((x) => x)),
        "statesFollowing": List<dynamic>.from(statesFollowing.map((x) => x)),
        "citiesFollowing": List<dynamic>.from(citiesFollowing.map((x) => x)),
        "storage": storage,
        "countriesToShow": List<dynamic>.from(countriesToShow.map((x) => x)),
        "activityScore": activityScore,
        "username": username,
        "role": role,
        "email": email,
        "plan": plan,
        "level": level,
        "confirmId": confirmId,
        "contacts": List<dynamic>.from(contacts.map((x) => x.toMap())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "completion": completion.toMap(),
        "activityMovement": activityMovement,
        "lastLogin": lastLogin.toIso8601String(),
        "countryOfResidence": countryOfResidence,
        "currency": currency,
        "displayLanguage": displayLanguage,
        "dob": dob.toIso8601String(),
        "firstname": firstname,
        "geoPreference": geoPreference == null ? null : geoPreference.toMap(),
        "income": income,
        "lastname": lastname,
        "maritalStatus": maritalStatus,
        "nationality": nationality,
        "profilePic": profilePic == null ? null : profilePic,
        "religion": religion,
        "salutation": salutation,
        "gender": gender,
        "subscription": subscription,
        "displayName": displayName,
        "paid": paid,
        "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x)),
        "businessWebsite": businessWebsite == null ? null : List<dynamic>.from(businessWebsite.map((x) => x)),
        "keywordsToWatch": keywordsToWatch == null ? null : List<dynamic>.from(keywordsToWatch.map((x) => x)),
        "auto": auto == null ? null : auto,
        "occupation": occupation == null ? null : occupation,
    };
}

class Contact {
    Contact({
        this.id,
        this.user,
        this.room,
        this.lastRead,
        this.updatedAt,
        this.createdAt,
    });

    String id;
    String user;
    String room;
    DateTime lastRead;
    DateTime updatedAt;
    DateTime createdAt;

    factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        id: json["_id"],
        user: json["user"],
        room: json["room"],
        lastRead: DateTime.parse(json["lastRead"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "user": user,
        "room": room,
        "lastRead": lastRead.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}

class GeoPreference {
    GeoPreference();

    factory GeoPreference.fromMap(Map<String, dynamic> json) => GeoPreference(
    );

    Map<String, dynamic> toMap() => {
    };
}

class Settings {
    Settings({
        this.showOccupation,
        this.useLocation,
    });

    bool showOccupation;
    bool useLocation;

    factory Settings.fromMap(Map<String, dynamic> json) => Settings(
        showOccupation: json["showOccupation"],
        useLocation: json["useLocation"],
    );

    Map<String, dynamic> toMap() => {
        "showOccupation": showOccupation,
        "useLocation": useLocation,
    };
}

class Opinion {
    Opinion({
        this.id,
        this.heading,
        this.createdBy,
        this.topic,
        this.video,
    });

    String id;
    String heading;
    OpinionCreatedBy createdBy;
    String topic;
    OpinionVideo video;

    factory Opinion.fromMap(Map<String, dynamic> json) => Opinion(
        id: json["_id"],
        heading: json["heading"],
        createdBy: OpinionCreatedBy.fromMap(json["createdBy"]),
        topic: json["topic"],
        video: OpinionVideo.fromMap(json["video"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "heading": heading,
        "createdBy": createdBy.toMap(),
        "topic": topic,
        "video": video.toMap(),
    };
}

class OpinionCreatedBy {
    OpinionCreatedBy({
        this.id,
        this.profilePic,
    });

    String id;
    String profilePic;

    factory OpinionCreatedBy.fromMap(Map<String, dynamic> json) => OpinionCreatedBy(
        id: json["_id"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "profilePic": profilePic == null ? null : profilePic,
    };
}

class OpinionVideo {
    OpinionVideo({
        this.id,
        this.thumbnail,
    });

    String id;
    String thumbnail;

    factory OpinionVideo.fromMap(Map<String, dynamic> json) => OpinionVideo(
        id: json["_id"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "thumbnail": thumbnail,
    };
}

class Stand {
    Stand({
        this.id,
        this.user,
        this.topic,
        this.stand,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String user;
    String topic;
    String stand;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Stand.fromMap(Map<String, dynamic> json) => Stand(
        id: json["_id"],
        user: json["user"],
        topic: json["topic"],
        stand: json["stand"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "user": user,
        "topic": topic,
        "stand": stand,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class UserRating {
    UserRating({
        this.id,
        this.rating,
        this.stand,
        this.opinion,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String rating;
    String stand;
    String opinion;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory UserRating.fromMap(Map<String, dynamic> json) => UserRating(
        id: json["_id"],
        rating: json["rating"]!=null ?json["rating"].toString():'0',
        stand: json["stand"],
        opinion: json["opinion"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "rating": rating,
        "stand": stand,
        "opinion": opinion,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class DatumVideo {
    DatumVideo({
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

    factory DatumVideo.fromMap(Map<String, dynamic> json) => DatumVideo(
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

    Map<String, dynamic> toMap() => {
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



// class OpinionModel {
//     OpinionModel({
//         this.data,
//         this.message,
//         this.key,
//         this.code,
//     });

//     List<OpinionData> data;
//     String message;
//     String key;
//     int code;

//     factory OpinionModel.fromMap(Map<String, dynamic> json) => OpinionModel(
//         data: List<OpinionData>.from(json["data"].map((x) => OpinionData.fromMap(x))),
//         message: json["message"],
//         key: json["key"],
//         code: json["code"],
//     );

//     Map<String, dynamic> toMap() => {
//         "data": List<dynamic>.from(data.map((x) => x.toMap())),
//         "message": message,
//         "key": key,
//         "code": code,
//     };
// }

// class OpinionData {
//     OpinionData({
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
//         this.stand,
//         this.country,
//         this.language,
//         this.createdBy,
//         this.video,
//         this.details,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.userRatings,
//         this.subcatName,
//         this.state,
//         this.city,
//     });

//     String id;
//     Audience audience;
//     double rating;
//     double totalRating;
//     int numberOfRatings;
//     int views;
//     bool deleted;
//     bool requestEngagement;
//     Topic topic;
//     String heading;
//     Category category;
//     String subCategory;
//     String description;
//     StandEnum stand;
//     Country country;
//     Language language;
//     DatumCreatedBy createdBy;
//     DatumVideo video;
//     Details details;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     List<UserRating> userRatings;
//     String subcatName;
//     String state;
//     String city;

//     factory OpinionData.fromMap(Map<String, dynamic> json) => OpinionData(
//         id: json["_id"],
//         audience: audienceValues.map[json["audience"]],
//         rating: json["rating"].toDouble(),
//         totalRating: json["totalRating"].toDouble(),
//         numberOfRatings: json["numberOfRatings"],
//         views: json["views"],
//         deleted: json["deleted"],
//         requestEngagement: json["requestEngagement"] == null ? null : json["requestEngagement"],
//         topic: Topic.fromMap(json["topic"]),
//         heading: json["heading"],
//         category: Category.fromMap(json["category"]),
//         subCategory: json["subCategory"],
//         description: json["description"] == null ? null : json["description"],
//         stand: standEnumValues.map[json["stand"]],
//         country: Country.fromMap(json["country"]),
//         language: json["language"] == null ? null : languageValues.map[json["language"]],
//         createdBy: DatumCreatedBy.fromMap(json["createdBy"]),
//         video: DatumVideo.fromMap(json["video"]),
//         details: Details.fromMap(json["details"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         userRatings: List<UserRating>.from(json["userRatings"].map((x) => UserRating.fromMap(x))),
//         subcatName: json["subcatName"],
//         state: json["state"] == null ? null : json["state"],
//         city: json["city"] == null ? null : json["city"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "audience": audienceValues.reverse[audience],
//         "rating": rating,
//         "totalRating": totalRating,
//         "numberOfRatings": numberOfRatings,
//         "views": views,
//         "deleted": deleted,
//         "requestEngagement": requestEngagement == null ? null : requestEngagement,
//         "topic": topic.toMap(),
//         "heading": heading,
//         "category": category.toMap(),
//         "subCategory": subCategory,
//         "description": description == null ? null : description,
//         "stand": standEnumValues.reverse[stand],
//         "country": country.toMap(),
//         "language": language == null ? null : languageValues.reverse[language],
//         "createdBy": createdBy.toMap(),
//         "video": video.toMap(),
//         "details": details.toMap(),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "userRatings": List<dynamic>.from(userRatings.map((x) => x.toMap())),
//         "subcatName": subcatName,
//         "state": state == null ? null : state,
//         "city": city == null ? null : city,
//     };
// }

// enum Audience { PUBLIC }

// final audienceValues = EnumValues({
//     "Public": Audience.PUBLIC
// });

// class Category {
//     Category({
//         this.id,
//         this.status,
//         this.tags,
//         this.name,
//         this.subcategories,
//         this.v,
//         this.profilePic,
//         this.createdBy,
//         this.associatedBusiness,
//     });

//     String id;
//     Status status;
//     List<String> tags;
//     String name;
//     List<Subcategor> subcategories;
//     int v;
//     String profilePic;
//     String createdBy;
//     AssociatedBusiness associatedBusiness;

//     factory Category.fromMap(Map<String, dynamic> json) => Category(
//         id: json["_id"],
//         status: statusValues.map[json["status"]],
//         tags: List<String>.from(json["tags"].map((x) => x)),
//         name: json["name"],
//         subcategories: List<Subcategor>.from(json["subcategories"].map((x) => Subcategor.fromMap(x))),
//         v: json["__v"],
//         profilePic: json["profilePic"],
//         createdBy: json["createdBy"] == null ? null : json["createdBy"],
//         associatedBusiness: json["associatedBusiness"] == null ? null : AssociatedBusiness.fromMap(json["associatedBusiness"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "status": statusValues.reverse[status],
//         "tags": List<dynamic>.from(tags.map((x) => x)),
//         "name": name,
//         "subcategories": List<dynamic>.from(subcategories.map((x) => x.toMap())),
//         "__v": v,
//         "profilePic": profilePic,
//         "createdBy": createdBy == null ? null : createdBy,
//         "associatedBusiness": associatedBusiness == null ? null : associatedBusiness.toMap(),
//     };
// }

// class AssociatedBusiness {
//     AssociatedBusiness({
//         this.id,
//         this.settings,
//         this.verified,
//         this.paid,
//         this.agreeTerms,
//         this.languagesSpoken,
//         this.followers,
//         this.following,
//         this.topicOfInterests,
//         this.subCategories,
//         this.countriesFollowing,
//         this.statesFollowing,
//         this.citiesFollowing,
//         this.storage,
//         this.countriesToShow,
//         this.activityScore,
//         this.subscription,
//         this.username,
//         this.hostName,
//         this.email,
//         this.position,
//         this.firstname,
//         this.lastname,
//         this.phoneNumber,
//         this.countryCode,
//         this.countryCodeIso2,
//         this.invoiceNumber,
//         this.businessWebsite,
//         this.profilePic,
//         this.businessDetails,
//         this.supportedCategories,
//         this.role,
//         this.plan,
//         this.contacts,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.activityMovement,
//         this.lastLogin,
//         this.aboutUs,
//         this.completion,
//         this.cover,
//         this.displayName,
//         this.geoPreference,
//         this.income,
//         this.keywordsToWatch,
//     });

//     String id;
//     Settings settings;
//     bool verified;
//     bool paid;
//     bool agreeTerms;
//     List<dynamic> languagesSpoken;
//     List<Follower> followers;
//     List<dynamic> following;
//     List<dynamic> topicOfInterests;
//     List<String> subCategories;
//     List<dynamic> countriesFollowing;
//     List<dynamic> statesFollowing;
//     List<dynamic> citiesFollowing;
//     int storage;
//     List<dynamic> countriesToShow;
//     double activityScore;
//     bool subscription;
//     String username;
//     String hostName;
//     String email;
//     String position;
//     UsernameEnum firstname;
//     String lastname;
//     String phoneNumber;
//     String countryCode;
//     String countryCodeIso2;
//     String invoiceNumber;
//     List<BusinessWebsite> businessWebsite;
//     String profilePic;
//     BusinessDetails businessDetails;
//     List<SupportedCategory> supportedCategories;
//     String role;
//     Plan plan;
//     List<dynamic> contacts;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     ActivityMovement activityMovement;
//     DateTime lastLogin;
//     String aboutUs;
//     Completion completion;
//     String cover;
//     String displayName;
//     GeoPreference geoPreference;
//     dynamic income;
//     List<String> keywordsToWatch;

//     factory AssociatedBusiness.fromMap(Map<String, dynamic> json) => AssociatedBusiness(
//         id: json["_id"],
//         settings: Settings.fromMap(json["settings"]),
//         verified: json["verified"],
//         paid: json["paid"],
//         agreeTerms: json["agreeTerms"],
//         languagesSpoken: List<dynamic>.from(json["languagesSpoken"].map((x) => x)),
//         followers: List<Follower>.from(json["followers"].map((x) => followerValues.map[x])),
//         following: List<dynamic>.from(json["following"].map((x) => x)),
//         topicOfInterests: List<dynamic>.from(json["topicOfInterests"].map((x) => x)),
//         subCategories: List<String>.from(json["subCategories"].map((x) => x)),
//         countriesFollowing: List<dynamic>.from(json["countriesFollowing"].map((x) => x)),
//         statesFollowing: List<dynamic>.from(json["statesFollowing"].map((x) => x)),
//         citiesFollowing: List<dynamic>.from(json["citiesFollowing"].map((x) => x)),
//         storage: json["storage"],
//         countriesToShow: List<dynamic>.from(json["countriesToShow"].map((x) => x)),
//         activityScore: json["activityScore"].toDouble(),
//         subscription: json["subscription"],
//         username: json["username"],
//         hostName: json["hostName"],
//         email: json["email"],
//         position: json["position"],
//         firstname: usernameEnumValues.map[json["firstname"]],
//         lastname: json["lastname"],
//         phoneNumber: json["phoneNumber"],
//         countryCode: json["countryCode"],
//         countryCodeIso2: json["countryCodeIso2"],
//         invoiceNumber: json["invoiceNumber"],
//         businessWebsite: List<BusinessWebsite>.from(json["businessWebsite"].map((x) => BusinessWebsite.fromMap(x))),
//         profilePic: json["profilePic"],
//         businessDetails: BusinessDetails.fromMap(json["businessDetails"]),
//         supportedCategories: List<SupportedCategory>.from(json["supportedCategories"].map((x) => SupportedCategory.fromMap(x))),
//         role: json["role"],
//         plan: planValues.map[json["plan"]],
//         contacts: List<dynamic>.from(json["contacts"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         activityMovement: activityMovementValues.map[json["activityMovement"]],
//         lastLogin: DateTime.parse(json["lastLogin"]),
//         aboutUs: json["aboutUs"],
//         completion: Completion.fromMap(json["completion"]),
//         cover: json["cover"],
//         displayName: json["displayName"],
//         geoPreference: GeoPreference.fromMap(json["geoPreference"]),
//         income: json["income"],
//         keywordsToWatch: List<String>.from(json["keywordsToWatch"].map((x) => x)),
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "settings": settings.toMap(),
//         "verified": verified,
//         "paid": paid,
//         "agreeTerms": agreeTerms,
//         "languagesSpoken": List<dynamic>.from(languagesSpoken.map((x) => x)),
//         "followers": List<dynamic>.from(followers.map((x) => followerValues.reverse[x])),
//         "following": List<dynamic>.from(following.map((x) => x)),
//         "topicOfInterests": List<dynamic>.from(topicOfInterests.map((x) => x)),
//         "subCategories": List<dynamic>.from(subCategories.map((x) => x)),
//         "countriesFollowing": List<dynamic>.from(countriesFollowing.map((x) => x)),
//         "statesFollowing": List<dynamic>.from(statesFollowing.map((x) => x)),
//         "citiesFollowing": List<dynamic>.from(citiesFollowing.map((x) => x)),
//         "storage": storage,
//         "countriesToShow": List<dynamic>.from(countriesToShow.map((x) => x)),
//         "activityScore": activityScore,
//         "subscription": subscription,
//         "username": username,
//         "hostName": hostName,
//         "email": email,
//         "position": position,
//         "firstname": usernameEnumValues.reverse[firstname],
//         "lastname": lastname,
//         "phoneNumber": phoneNumber,
//         "countryCode": countryCode,
//         "countryCodeIso2": countryCodeIso2,
//         "invoiceNumber": invoiceNumber,
//         "businessWebsite": List<dynamic>.from(businessWebsite.map((x) => x.toMap())),
//         "profilePic": profilePic,
//         "businessDetails": businessDetails.toMap(),
//         "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x.toMap())),
//         "role": role,
//         "plan": planValues.reverse[plan],
//         "contacts": List<dynamic>.from(contacts.map((x) => x)),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "activityMovement": activityMovementValues.reverse[activityMovement],
//         "lastLogin": lastLogin.toIso8601String(),
//         "aboutUs": aboutUs,
//         "completion": completion.toMap(),
//         "cover": cover,
//         "displayName": displayName,
//         "geoPreference": geoPreference.toMap(),
//         "income": income,
//         "keywordsToWatch": List<dynamic>.from(keywordsToWatch.map((x) => x)),
//     };
// }

// enum ActivityMovement { UP, DOWN }

// final activityMovementValues = EnumValues({
//     "Down": ActivityMovement.DOWN,
//     "Up": ActivityMovement.UP
// });

// class BusinessDetails {
//     BusinessDetails({
//         this.id,
//         this.name,
//         this.registrationNumber,
//         this.industry,
//         this.tradingName,
//         this.employeesCount,
//         this.postalAddress,
//         this.headOfficeAddress,
//         this.subscriptionDate,
//     });

//     String id;
//     String name;
//     String registrationNumber;
//     String industry;
//     String tradingName;
//     int employeesCount;
//     Address postalAddress;
//     Address headOfficeAddress;
//     DateTime subscriptionDate;

//     factory BusinessDetails.fromMap(Map<String, dynamic> json) => BusinessDetails(
//         id: json["_id"],
//         name: json["name"],
//         registrationNumber: json["registrationNumber"],
//         industry: json["industry"],
//         tradingName: json["tradingName"],
//         employeesCount: json["employeesCount"],
//         postalAddress: Address.fromMap(json["postalAddress"]),
//         headOfficeAddress: Address.fromMap(json["headOfficeAddress"]),
//         subscriptionDate: DateTime.parse(json["subscriptionDate"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "name": name,
//         "registrationNumber": registrationNumber,
//         "industry": industry,
//         "tradingName": tradingName,
//         "employeesCount": employeesCount,
//         "postalAddress": postalAddress.toMap(),
//         "headOfficeAddress": headOfficeAddress.toMap(),
//         "subscriptionDate": subscriptionDate.toIso8601String(),
//     };
// }

// class Address {
//     Address({
//         this.id,
//         this.street,
//         this.building,
//         this.level,
//         this.suite,
//         this.country,
//         this.state,
//         this.city,
//     });

//     String id;
//     String street;
//     String building;
//     String level;
//     String suite;
//     Id country;
//     String state;
//     String city;

//     factory Address.fromMap(Map<String, dynamic> json) => Address(
//         id: json["_id"],
//         street: json["street"],
//         building: json["building"],
//         level: json["level"],
//         suite: json["suite"],
//         country: idValues.map[json["country"]],
//         state: json["state"],
//         city: json["city"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "street": street,
//         "building": building,
//         "level": level,
//         "suite": suite,
//         "country": idValues.reverse[country],
//         "state": state,
//         "city": city,
//     };
// }

// enum Id { THE_5_D43_E8959_BF49_CDDDE3_BF9_D8, THE_5_CF8_B3_A8635_E13083_BEB3_E07, THE_5_CF8_B3_A6635_E13083_BEB34_B2, THE_5_F44_CEE4_E6_A63213_D49_DBE93, THE_5_CF8_B3_A6635_E13083_BEB3377, THE_5_CF8_B39_C635_E13083_BEAE7_C4, THE_5_CF8_B39_B635_E13083_BEAE251, THE_5_CF8_B39_A635_E13083_BEADDFA }

// final idValues = EnumValues({
//     "5cf8b39a635e13083beaddfa": Id.THE_5_CF8_B39_A635_E13083_BEADDFA,
//     "5cf8b39b635e13083beae251": Id.THE_5_CF8_B39_B635_E13083_BEAE251,
//     "5cf8b39c635e13083beae7c4": Id.THE_5_CF8_B39_C635_E13083_BEAE7_C4,
//     "5cf8b3a6635e13083beb3377": Id.THE_5_CF8_B3_A6635_E13083_BEB3377,
//     "5cf8b3a6635e13083beb34b2": Id.THE_5_CF8_B3_A6635_E13083_BEB34_B2,
//     "5cf8b3a8635e13083beb3e07": Id.THE_5_CF8_B3_A8635_E13083_BEB3_E07,
//     "5d43e8959bf49cddde3bf9d8": Id.THE_5_D43_E8959_BF49_CDDDE3_BF9_D8,
//     "5f44cee4e6a63213d49dbe93": Id.THE_5_F44_CEE4_E6_A63213_D49_DBE93
// });

// class BusinessWebsite {
//     BusinessWebsite({
//         this.id,
//         this.label,
//         this.businessWebsite,
//     });

//     String id;
//     String label;
//     String businessWebsite;

//     factory BusinessWebsite.fromMap(Map<String, dynamic> json) => BusinessWebsite(
//         id: json["_id"],
//         label: json["label"],
//         businessWebsite: json["businessWebsite"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "label": label,
//         "businessWebsite": businessWebsite,
//     };
// }

// class Completion {
//     Completion({
//         this.percentage,
//         this.title,
//     });

//     int percentage;
//     Title title;

//     factory Completion.fromMap(Map<String, dynamic> json) => Completion(
//         percentage: json["percentage"],
//         title: titleValues.map[json["title"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "percentage": percentage,
//         "title": titleValues.reverse[title],
//     };
// }

// enum Title { SILVER, STARTER, GOLD }

// final titleValues = EnumValues({
//     "Gold": Title.GOLD,
//     "Silver": Title.SILVER,
//     "Starter": Title.STARTER
// });

// enum UsernameEnum { SAVANNAHPEARSON, MSTRAVEL, HOTELREVIEWER, SPEAKUP, MRPOLITICS, MAYAYOSHIDA, ECONO_LODGE_PARK_LANE_BUNDABERG, BESTFOODS, DAVE_LINDBERG, ARGUED, TEMP_OCEANIA, DAVELINDBERG, JOSECOLMENARES, DEMOBH, NAME_SPEAKUP, WR, GLOBAL_TOPICS, WACKYREVIEWS, NAME_ECONO_LODGE_PARK_LANE_BUNDABERG, NAME_TEMP_OCEANIA }

// final usernameEnumValues = EnumValues({
//     "argued": UsernameEnum.ARGUED,
//     "bestfoods": UsernameEnum.BESTFOODS,
//     "davelindberg": UsernameEnum.DAVELINDBERG,
//     "DaveLindberg": UsernameEnum.DAVE_LINDBERG,
//     "demobh": UsernameEnum.DEMOBH,
//     "Econo_Lodge_Park_Lane_Bundaberg": UsernameEnum.ECONO_LODGE_PARK_LANE_BUNDABERG,
//     "global_topics": UsernameEnum.GLOBAL_TOPICS,
//     "hotelreviewer": UsernameEnum.HOTELREVIEWER,
//     "josecolmenares": UsernameEnum.JOSECOLMENARES,
//     "mayayoshida": UsernameEnum.MAYAYOSHIDA,
//     "mrpolitics": UsernameEnum.MRPOLITICS,
//     "mstravel": UsernameEnum.MSTRAVEL,
//     "econo_lodge_park_lane_bundaberg": UsernameEnum.NAME_ECONO_LODGE_PARK_LANE_BUNDABERG,
//     "speakup": UsernameEnum.NAME_SPEAKUP,
//     "temp_oceania": UsernameEnum.NAME_TEMP_OCEANIA,
//     "savannahpearson": UsernameEnum.SAVANNAHPEARSON,
//     "Speakup": UsernameEnum.SPEAKUP,
//     "Temp_Oceania": UsernameEnum.TEMP_OCEANIA,
//     "wackyreviews": UsernameEnum.WACKYREVIEWS,
//     "wr": UsernameEnum.WR
// });

// enum Follower { THE_5_DE4_D6_CF26_D43127_CA9_A46_E6, THE_5_DC4_D377_D758663286_E553_C2, THE_5_DC4_FD71_D758663286_E55431, THE_5_F5_ADE7_CE590_B141_D2_F3_C7_C9, THE_5_DC4_B01_FD758663286_E553_AF }

// final followerValues = EnumValues({
//     "5dc4b01fd758663286e553af": Follower.THE_5_DC4_B01_FD758663286_E553_AF,
//     "5dc4d377d758663286e553c2": Follower.THE_5_DC4_D377_D758663286_E553_C2,
//     "5dc4fd71d758663286e55431": Follower.THE_5_DC4_FD71_D758663286_E55431,
//     "5de4d6cf26d43127ca9a46e6": Follower.THE_5_DE4_D6_CF26_D43127_CA9_A46_E6,
//     "5f5ade7ce590b141d2f3c7c9": Follower.THE_5_F5_ADE7_CE590_B141_D2_F3_C7_C9
// });

// class GeoPreference {
//     GeoPreference();

//     factory GeoPreference.fromMap(Map<String, dynamic> json) => GeoPreference(
//     );

//     Map<String, dynamic> toMap() => {
//     };
// }

// enum Plan { THE_5_DC8_F7_E34_CEC254_FF409_D900, THE_5_DC8_F8014_CEC254_FF409_D90_A }

// final planValues = EnumValues({
//     "5dc8f7e34cec254ff409d900": Plan.THE_5_DC8_F7_E34_CEC254_FF409_D900,
//     "5dc8f8014cec254ff409d90a": Plan.THE_5_DC8_F8014_CEC254_FF409_D90_A
// });

// class Settings {
//     Settings({
//         this.showOccupation,
//         this.useLocation,
//     });

//     bool showOccupation;
//     bool useLocation;

//     factory Settings.fromMap(Map<String, dynamic> json) => Settings(
//         showOccupation: json["showOccupation"],
//         useLocation: json["useLocation"],
//     );

//     Map<String, dynamic> toMap() => {
//         "showOccupation": showOccupation,
//         "useLocation": useLocation,
//     };
// }

// class SupportedCategory {
//     SupportedCategory({
//         this.id,
//         this.category,
//         this.subCategory,
//         this.categoryName,
//         this.subCategoryName,
//     });

//     String id;
//     String category;
//     String subCategory;
//     String categoryName;
//     String subCategoryName;

//     factory SupportedCategory.fromMap(Map<String, dynamic> json) => SupportedCategory(
//         id: json["_id"],
//         category: json["category"],
//         subCategory: json["subCategory"],
//         categoryName: json["categoryName"],
//         subCategoryName: json["subCategoryName"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "category": category,
//         "subCategory": subCategory,
//         "categoryName": categoryName,
//         "subCategoryName": subCategoryName,
//     };
// }

// enum Status { APPROVED }

// final statusValues = EnumValues({
//     "Approved": Status.APPROVED
// });

// class Subcategor {
//     Subcategor({
//         this.status,
//         this.tags,
//         this.id,
//         this.name,
//         this.profilePic,
//         this.associatedBusiness,
//         this.description,
//     });

//     Status status;
//     List<String> tags;
//     String id;
//     String name;
//     String profilePic;
//     String associatedBusiness;
//     String description;

//     factory Subcategor.fromMap(Map<String, dynamic> json) => Subcategor(
//         status: statusValues.map[json["status"]],
//         tags: List<String>.from(json["tags"].map((x) => x)),
//         id: json["_id"],
//         name: json["name"],
//         profilePic: json["profilePic"] == null ? null : json["profilePic"],
//         associatedBusiness: json["associatedBusiness"] == null ? null : json["associatedBusiness"],
//         description: json["description"] == null ? null : json["description"],
//     );

//     Map<String, dynamic> toMap() => {
//         "status": statusValues.reverse[status],
//         "tags": List<dynamic>.from(tags.map((x) => x)),
//         "_id": id,
//         "name": name,
//         "profilePic": profilePic == null ? null : profilePic,
//         "associatedBusiness": associatedBusiness == null ? null : associatedBusiness,
//         "description": description == null ? null : description,
//     };
// }

// class Country {
//     Country({
//         this.id,
//         this.name,
//     });

//     Id id;
//     NameEnum name;

//     factory Country.fromMap(Map<String, dynamic> json) => Country(
//         id: idValues.map[json["_id"]],
//         name: nameEnumValues.map[json["name"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": idValues.reverse[id],
//         "name": nameEnumValues.reverse[name],
//     };
// }

// enum NameEnum { GLOBAL, UNITED_STATES, SINGAPORE, EUROPEAN_UNION, SAUDI_ARABIA, CANADA, BRAZIL, AUSTRALIA }

// final nameEnumValues = EnumValues({
//     "Australia": NameEnum.AUSTRALIA,
//     "Brazil": NameEnum.BRAZIL,
//     "Canada": NameEnum.CANADA,
//     "European Union": NameEnum.EUROPEAN_UNION,
//     "Global": NameEnum.GLOBAL,
//     "Saudi Arabia": NameEnum.SAUDI_ARABIA,
//     "Singapore": NameEnum.SINGAPORE,
//     "United States": NameEnum.UNITED_STATES
// });

// class DatumCreatedBy {
//     DatumCreatedBy({
//         this.id,
//         this.verified,
//         this.activityScore,
//         this.username,
//         this.completion,
//         this.displayName,
//         this.profilePic,
//         this.level,
//         this.associatedBusiness,
//     });

//     String id;
//     bool verified;
//     double activityScore;
//     UsernameEnum username;
//     Completion completion;
//     String displayName;
//     String profilePic;
//     String level;
//     AssociatedBusiness associatedBusiness;

//     factory DatumCreatedBy.fromMap(Map<String, dynamic> json) => DatumCreatedBy(
//         id: json["_id"],
//         verified: json["verified"],
//         activityScore: json["activityScore"].toDouble(),
//         username: usernameEnumValues.map[json["username"]],
//         completion: Completion.fromMap(json["completion"]),
//         displayName: json["displayName"] == null ? null : json["displayName"],
//         profilePic: json["profilePic"] == null ? null : json["profilePic"],
//         level: json["level"] == null ? null : json["level"],
//         associatedBusiness: json["associatedBusiness"] == null ? null : AssociatedBusiness.fromMap(json["associatedBusiness"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "verified": verified,
//         "activityScore": activityScore,
//         "username": usernameEnumValues.reverse[username],
//         "completion": completion.toMap(),
//         "displayName": displayName == null ? null : displayName,
//         "profilePic": profilePic == null ? null : profilePic,
//         "level": level == null ? null : level,
//         "associatedBusiness": associatedBusiness == null ? null : associatedBusiness.toMap(),
//     };
// }

// class Details {
//     Details({
//         this.subCategoryName,
//         this.categoryName,
//         this.countryName,
//         this.topicName,
//         this.userName,
//         this.stateName,
//         this.cityName,
//     });

//     String subCategoryName;
//     String categoryName;
//     NameEnum countryName;
//     String topicName;
//     UsernameEnum userName;
//     StateName stateName;
//     CityName cityName;

//     factory Details.fromMap(Map<String, dynamic> json) => Details(
//         subCategoryName: json["subCategoryName"],
//         categoryName: json["categoryName"],
//         countryName: nameEnumValues.map[json["countryName"]],
//         topicName: json["topicName"] == null ? null : json["topicName"],
//         userName: usernameEnumValues.map[json["userName"]],
//         stateName: json["stateName"] == null ? null : stateNameValues.map[json["stateName"]],
//         cityName: json["cityName"] == null ? null : cityNameValues.map[json["cityName"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "subCategoryName": subCategoryName,
//         "categoryName": categoryName,
//         "countryName": nameEnumValues.reverse[countryName],
//         "topicName": topicName == null ? null : topicName,
//         "userName": usernameEnumValues.reverse[userName],
//         "stateName": stateName == null ? null : stateNameValues.reverse[stateName],
//         "cityName": cityName == null ? null : cityNameValues.reverse[cityName],
//     };
// }

// enum CityName { OTHER }

// final cityNameValues = EnumValues({
//     "Other": CityName.OTHER
// });

// enum StateName { NATIONAL }

// final stateNameValues = EnumValues({
//     "National": StateName.NATIONAL
// });

// enum Language { ENGLISH, SPANISH_CASTILIAN }

// final languageValues = EnumValues({
//     "English": Language.ENGLISH,
//     "Spanish, Castilian": Language.SPANISH_CASTILIAN
// });

// enum StandEnum { NEUTRAL, FOR, AGAINST }

// final standEnumValues = EnumValues({
//     "Against": StandEnum.AGAINST,
//     "For": StandEnum.FOR,
//     "Neutral": StandEnum.NEUTRAL
// });

// class Topic {
//     Topic({
//         this.id,
//         this.status,
//         this.views,
//         this.opinionsCount,
//         this.country,
//         this.name,
//         this.category,
//         this.description,
//         this.createdBy,
//         this.subcategory,
//         this.details,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.opinions,
//         this.stand,
//         this.createdByName,
//         this.city,
//         this.state,
//         this.profilePic,
//     });

//     String id;
//     Status status;
//     int views;
//     int opinionsCount;
//     Id country;
//     String name;
//     String category;
//     String description;
//     TopicCreatedBy createdBy;
//     String subcategory;
//     Details details;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     List<Opinion> opinions;
//     List<StandElement> stand;
//     CreatedByName createdByName;
//     String city;
//     String state;
//     String profilePic;

//     factory Topic.fromMap(Map<String, dynamic> json) => Topic(
//         id: json["_id"],
//         status: statusValues.map[json["status"]],
//         views: json["views"],
//         opinionsCount: json["opinionsCount"],
//         country: idValues.map[json["country"]],
//         name: json["name"],
//         category: json["category"],
//         description: json["description"] == null ? null : json["description"],
//         createdBy: TopicCreatedBy.fromMap(json["createdBy"]),
//         subcategory: json["subcategory"],
//         details: Details.fromMap(json["details"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         opinions: List<Opinion>.from(json["opinions"].map((x) => Opinion.fromMap(x))),
//         stand: List<StandElement>.from(json["stand"].map((x) => StandElement.fromMap(x))),
//         createdByName: CreatedByName.fromMap(json["createdByName"]),
//         city: json["city"] == null ? null : json["city"],
//         state: json["state"] == null ? null : json["state"],
//         profilePic: json["profilePic"] == null ? null : json["profilePic"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "status": statusValues.reverse[status],
//         "views": views,
//         "opinionsCount": opinionsCount,
//         "country": idValues.reverse[country],
//         "name": name,
//         "category": category,
//         "description": description == null ? null : description,
//         "createdBy": createdBy.toMap(),
//         "subcategory": subcategory,
//         "details": details.toMap(),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "opinions": List<dynamic>.from(opinions.map((x) => x.toMap())),
//         "stand": List<dynamic>.from(stand.map((x) => x.toMap())),
//         "createdByName": createdByName.toMap(),
//         "city": city == null ? null : city,
//         "state": state == null ? null : state,
//         "profilePic": profilePic == null ? null : profilePic,
//     };
// }

// class TopicCreatedBy {
//     TopicCreatedBy({
//         this.id,
//         this.settings,
//         this.verified,
//         this.paid,
//         this.agreeTerms,
//         this.languagesSpoken,
//         this.followers,
//         this.following,
//         this.topicOfInterests,
//         this.subCategories,
//         this.countriesFollowing,
//         this.statesFollowing,
//         this.citiesFollowing,
//         this.storage,
//         this.countriesToShow,
//         this.activityScore,
//         this.subscription,
//         this.username,
//         this.email,
//         this.confirmId,
//         this.role,
//         this.plan,
//         this.countryOfOrigin,
//         this.contacts,
//         this.supportedCategories,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.completion,
//         this.displayName,
//         this.geoPreference,
//         this.income,
//         this.profilePic,
//         this.businessWebsite,
//         this.activityMovement,
//         this.lastLogin,
//         this.keywordsToWatch,
//         this.firstname,
//         this.lastname,
//         this.gender,
//         this.dob,
//         this.salutation,
//         this.level,
//         this.countryOfResidence,
//         this.currency,
//         this.displayLanguage,
//         this.maritalStatus,
//         this.nationality,
//         this.religion,
//         this.occupation,
//         this.auto,
//         this.countryCode,
//         this.countryCodeIso2,
//         this.phoneNumber,
//         this.associatedBusiness,
//     });

//     String id;
//     Settings settings;
//     bool verified;
//     bool paid;
//     bool agreeTerms;
//     List<Language> languagesSpoken;
//     List<Follower> followers;
//     List<Following> following;
//     List<String> topicOfInterests;
//     List<String> subCategories;
//     List<dynamic> countriesFollowing;
//     List<dynamic> statesFollowing;
//     List<dynamic> citiesFollowing;
//     int storage;
//     List<String> countriesToShow;
//     double activityScore;
//     bool subscription;
//     UsernameEnum username;
//     String email;
//     String confirmId;
//     Role role;
//     Plan plan;
//     CountryOfOrigin countryOfOrigin;
//     List<Contact> contacts;
//     List<dynamic> supportedCategories;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     Completion completion;
//     String displayName;
//     GeoPreference geoPreference;
//     String income;
//     String profilePic;
//     List<dynamic> businessWebsite;
//     ActivityMovement activityMovement;
//     DateTime lastLogin;
//     List<dynamic> keywordsToWatch;
//     String firstname;
//     String lastname;
//     Gender gender;
//     DateTime dob;
//     Salutation salutation;
//     String level;
//     Id countryOfResidence;
//     Currency currency;
//     Language displayLanguage;
//     MaritalStatus maritalStatus;
//     String nationality;
//     Religion religion;
//     String occupation;
//     bool auto;
//     String countryCode;
//     String countryCodeIso2;
//     String phoneNumber;
//     AssociatedBusiness associatedBusiness;

//     factory TopicCreatedBy.fromMap(Map<String, dynamic> json) => TopicCreatedBy(
//         id: json["_id"],
//         settings: Settings.fromMap(json["settings"]),
//         verified: json["verified"],
//         paid: json["paid"] == null ? null : json["paid"],
//         agreeTerms: json["agreeTerms"],
//         languagesSpoken: List<Language>.from(json["languagesSpoken"].map((x) => languageValues.map[x])),
//         followers: List<Follower>.from(json["followers"].map((x) => followerValues.map[x])),
//         following: List<Following>.from(json["following"].map((x) => followingValues.map[x])),
//         topicOfInterests: List<String>.from(json["topicOfInterests"].map((x) => x)),
//         subCategories: List<String>.from(json["subCategories"].map((x) => x)),
//         countriesFollowing: List<dynamic>.from(json["countriesFollowing"].map((x) => x)),
//         statesFollowing: List<dynamic>.from(json["statesFollowing"].map((x) => x)),
//         citiesFollowing: List<dynamic>.from(json["citiesFollowing"].map((x) => x)),
//         storage: json["storage"],
//         countriesToShow: List<String>.from(json["countriesToShow"].map((x) => x)),
//         activityScore: json["activityScore"].toDouble(),
//         subscription: json["subscription"],
//         username: usernameEnumValues.map[json["username"]],
//         email: json["email"],
//         confirmId: json["confirmId"] == null ? null : json["confirmId"],
//         role: roleValues.map[json["role"]],
//         plan: planValues.map[json["plan"]],
//         countryOfOrigin: json["countryOfOrigin"] == null ? null : countryOfOriginValues.map[json["countryOfOrigin"]],
//         contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromMap(x))),
//         supportedCategories: json["supportedCategories"] == null ? null : List<dynamic>.from(json["supportedCategories"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         completion: Completion.fromMap(json["completion"]),
//         displayName: json["displayName"] == null ? null : json["displayName"],
//         geoPreference: json["geoPreference"] == null ? null : GeoPreference.fromMap(json["geoPreference"]),
//         income: json["income"] == null ? null : json["income"],
//         profilePic: json["profilePic"] == null ? null : json["profilePic"],
//         businessWebsite: json["businessWebsite"] == null ? null : List<dynamic>.from(json["businessWebsite"].map((x) => x)),
//         activityMovement: activityMovementValues.map[json["activityMovement"]],
//         lastLogin: DateTime.parse(json["lastLogin"]),
//         keywordsToWatch: json["keywordsToWatch"] == null ? null : List<dynamic>.from(json["keywordsToWatch"].map((x) => x)),
//         firstname: json["firstname"] == null ? null : json["firstname"],
//         lastname: json["lastname"] == null ? null : json["lastname"],
//         gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
//         dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
//         salutation: json["salutation"] == null ? null : salutationValues.map[json["salutation"]],
//         level: json["level"] == null ? null : json["level"],
//         countryOfResidence: json["countryOfResidence"] == null ? null : idValues.map[json["countryOfResidence"]],
//         currency: json["currency"] == null ? null : currencyValues.map[json["currency"]],
//         displayLanguage: json["displayLanguage"] == null ? null : languageValues.map[json["displayLanguage"]],
//         maritalStatus: json["maritalStatus"] == null ? null : maritalStatusValues.map[json["maritalStatus"]],
//         nationality: json["nationality"] == null ? null : json["nationality"],
//         religion: json["religion"] == null ? null : religionValues.map[json["religion"]],
//         occupation: json["occupation"] == null ? null : json["occupation"],
//         auto: json["auto"] == null ? null : json["auto"],
//         countryCode: json["countryCode"] == null ? null : json["countryCode"],
//         countryCodeIso2: json["countryCodeIso2"] == null ? null : json["countryCodeIso2"],
//         phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
//         associatedBusiness: json["associatedBusiness"] == null ? null : AssociatedBusiness.fromMap(json["associatedBusiness"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "settings": settings.toMap(),
//         "verified": verified,
//         "paid": paid == null ? null : paid,
//         "agreeTerms": agreeTerms,
//         "languagesSpoken": List<dynamic>.from(languagesSpoken.map((x) => languageValues.reverse[x])),
//         "followers": List<dynamic>.from(followers.map((x) => followerValues.reverse[x])),
//         "following": List<dynamic>.from(following.map((x) => followingValues.reverse[x])),
//         "topicOfInterests": List<dynamic>.from(topicOfInterests.map((x) => x)),
//         "subCategories": List<dynamic>.from(subCategories.map((x) => x)),
//         "countriesFollowing": List<dynamic>.from(countriesFollowing.map((x) => x)),
//         "statesFollowing": List<dynamic>.from(statesFollowing.map((x) => x)),
//         "citiesFollowing": List<dynamic>.from(citiesFollowing.map((x) => x)),
//         "storage": storage,
//         "countriesToShow": List<dynamic>.from(countriesToShow.map((x) => x)),
//         "activityScore": activityScore,
//         "subscription": subscription,
//         "username": usernameEnumValues.reverse[username],
//         "email": email,
//         "confirmId": confirmId == null ? null : confirmId,
//         "role": roleValues.reverse[role],
//         "plan": planValues.reverse[plan],
//         "countryOfOrigin": countryOfOrigin == null ? null : countryOfOriginValues.reverse[countryOfOrigin],
//         "contacts": List<dynamic>.from(contacts.map((x) => x.toMap())),
//         "supportedCategories": supportedCategories == null ? null : List<dynamic>.from(supportedCategories.map((x) => x)),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "completion": completion.toMap(),
//         "displayName": displayName == null ? null : displayName,
//         "geoPreference": geoPreference == null ? null : geoPreference.toMap(),
//         "income": income == null ? null : income,
//         "profilePic": profilePic == null ? null : profilePic,
//         "businessWebsite": businessWebsite == null ? null : List<dynamic>.from(businessWebsite.map((x) => x)),
//         "activityMovement": activityMovementValues.reverse[activityMovement],
//         "lastLogin": lastLogin.toIso8601String(),
//         "keywordsToWatch": keywordsToWatch == null ? null : List<dynamic>.from(keywordsToWatch.map((x) => x)),
//         "firstname": firstname == null ? null : firstname,
//         "lastname": lastname == null ? null : lastname,
//         "gender": gender == null ? null : genderValues.reverse[gender],
//         "dob": dob == null ? null : dob.toIso8601String(),
//         "salutation": salutation == null ? null : salutationValues.reverse[salutation],
//         "level": level == null ? null : level,
//         "countryOfResidence": countryOfResidence == null ? null : idValues.reverse[countryOfResidence],
//         "currency": currency == null ? null : currencyValues.reverse[currency],
//         "displayLanguage": displayLanguage == null ? null : languageValues.reverse[displayLanguage],
//         "maritalStatus": maritalStatus == null ? null : maritalStatusValues.reverse[maritalStatus],
//         "nationality": nationality == null ? null : nationality,
//         "religion": religion == null ? null : religionValues.reverse[religion],
//         "occupation": occupation == null ? null : occupation,
//         "auto": auto == null ? null : auto,
//         "countryCode": countryCode == null ? null : countryCode,
//         "countryCodeIso2": countryCodeIso2 == null ? null : countryCodeIso2,
//         "phoneNumber": phoneNumber == null ? null : phoneNumber,
//         "associatedBusiness": associatedBusiness == null ? null : associatedBusiness.toMap(),
//     };
// }

// class Contact {
//     Contact({
//         this.id,
//         this.user,
//         this.room,
//         this.lastRead,
//         this.updatedAt,
//         this.createdAt,
//     });

//     String id;
//     String user;
//     String room;
//     DateTime lastRead;
//     DateTime updatedAt;
//     DateTime createdAt;

//     factory Contact.fromMap(Map<String, dynamic> json) => Contact(
//         id: json["_id"],
//         user: json["user"],
//         room: json["room"],
//         lastRead: DateTime.parse(json["lastRead"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "user": user,
//         "room": room,
//         "lastRead": lastRead.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdAt": createdAt.toIso8601String(),
//     };
// }

// enum CountryOfOrigin { CO }

// final countryOfOriginValues = EnumValues({
//     "CO": CountryOfOrigin.CO
// });

// enum Currency { AUSTRALIAN_DOLLAR, US_DOLLAR }

// final currencyValues = EnumValues({
//     "Australian Dollar": Currency.AUSTRALIAN_DOLLAR,
//     "US Dollar": Currency.US_DOLLAR
// });

// enum Following { THE_5_E1_A5_FD36_C69226980_E67683, THE_5_DC4_B01_FD758663286_E553_AF, THE_5_F56_DC6_D76_B9290_EF9_F22_FCB, THE_5_F3_CE6_C4999_C4_C2_CAE1_E9002 }

// final followingValues = EnumValues({
//     "5dc4b01fd758663286e553af": Following.THE_5_DC4_B01_FD758663286_E553_AF,
//     "5e1a5fd36c69226980e67683": Following.THE_5_E1_A5_FD36_C69226980_E67683,
//     "5f3ce6c4999c4c2cae1e9002": Following.THE_5_F3_CE6_C4999_C4_C2_CAE1_E9002,
//     "5f56dc6d76b9290ef9f22fcb": Following.THE_5_F56_DC6_D76_B9290_EF9_F22_FCB
// });

// enum Gender { FEMALE, MALE }

// final genderValues = EnumValues({
//     "Female": Gender.FEMALE,
//     "Male": Gender.MALE
// });

// enum MaritalStatus { MARRIED, SINGLE }

// final maritalStatusValues = EnumValues({
//     "Married": MaritalStatus.MARRIED,
//     "Single": MaritalStatus.SINGLE
// });

// enum Religion { NEW_AGE, CATHOLICISM, ATHEISM }

// final religionValues = EnumValues({
//     "Atheism": Religion.ATHEISM,
//     "Catholicism": Religion.CATHOLICISM,
//     "New Age": Religion.NEW_AGE
// });

// enum Role { THE_5_CDD02_A52_C15_A633_B4821_AA9, THE_5_DA1465893_DD0_C1_CD95_C37_CA }

// final roleValues = EnumValues({
//     "5cdd02a52c15a633b4821aa9": Role.THE_5_CDD02_A52_C15_A633_B4821_AA9,
//     "5da1465893dd0c1cd95c37ca": Role.THE_5_DA1465893_DD0_C1_CD95_C37_CA
// });

// enum Salutation { MR }

// final salutationValues = EnumValues({
//     "Mr.": Salutation.MR
// });

// class CreatedByName {
//     CreatedByName({
//         this.id,
//         this.verified,
//         this.activityScore,
//         this.username,
//         this.completion,
//         this.profilePic,
//         this.level,
//         this.associatedBusiness,
//     });

//     String id;
//     bool verified;
//     double activityScore;
//     UsernameEnum username;
//     Completion completion;
//     String profilePic;
//     String level;
//     String associatedBusiness;

//     factory CreatedByName.fromMap(Map<String, dynamic> json) => CreatedByName(
//         id: json["_id"],
//         verified: json["verified"],
//         activityScore: json["activityScore"].toDouble(),
//         username: usernameEnumValues.map[json["username"]],
//         completion: Completion.fromMap(json["completion"]),
//         profilePic: json["profilePic"] == null ? null : json["profilePic"],
//         level: json["level"] == null ? null : json["level"],
//         associatedBusiness: json["associatedBusiness"] == null ? null : json["associatedBusiness"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "verified": verified,
//         "activityScore": activityScore,
//         "username": usernameEnumValues.reverse[username],
//         "completion": completion.toMap(),
//         "profilePic": profilePic == null ? null : profilePic,
//         "level": level == null ? null : level,
//         "associatedBusiness": associatedBusiness == null ? null : associatedBusiness,
//     };
// }

// class Opinion {
//     Opinion({
//         this.id,
//         this.heading,
//         this.createdBy,
//         this.topic,
//         this.video,
//     });

//     String id;
//     String heading;
//     OpinionCreatedBy createdBy;
//     String topic;
//     OpinionVideo video;

//     factory Opinion.fromMap(Map<String, dynamic> json) => Opinion(
//         id: json["_id"],
//         heading: json["heading"],
//         createdBy: OpinionCreatedBy.fromMap(json["createdBy"]),
//         topic: json["topic"],
//         video: OpinionVideo.fromMap(json["video"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "heading": heading,
//         "createdBy": createdBy.toMap(),
//         "topic": topic,
//         "video": video.toMap(),
//     };
// }

// class OpinionCreatedBy {
//     OpinionCreatedBy({
//         this.id,
//         this.profilePic,
//     });

//     String id;
//     String profilePic;

//     factory OpinionCreatedBy.fromMap(Map<String, dynamic> json) => OpinionCreatedBy(
//         id: json["_id"],
//         profilePic: json["profilePic"] == null ? null : json["profilePic"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "profilePic": profilePic == null ? null : profilePic,
//     };
// }

// class OpinionVideo {
//     OpinionVideo({
//         this.id,
//         this.thumbnail,
//     });

//     String id;
//     String thumbnail;

//     factory OpinionVideo.fromMap(Map<String, dynamic> json) => OpinionVideo(
//         id: json["_id"],
//         thumbnail: json["thumbnail"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "thumbnail": thumbnail,
//     };
// }

// class StandElement {
//     StandElement({
//         this.id,
//         this.user,
//         this.topic,
//         this.stand,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     String id;
//     String user;
//     String topic;
//     StandEnum stand;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;

//     factory StandElement.fromMap(Map<String, dynamic> json) => StandElement(
//         id: json["_id"],
//         user: json["user"],
//         topic: json["topic"],
//         stand: standEnumValues.map[json["stand"]],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "user": user,
//         "topic": topic,
//         "stand": standEnumValues.reverse[stand],
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//     };
// }

// class UserRating {
//     UserRating({
//         this.id,
//         this.rating,
//         this.stand,
//         this.opinion,
//         this.createdBy,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     String id;
//     double rating;
//     StandEnum stand;
//     String opinion;
//     String createdBy;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;

//     factory UserRating.fromMap(Map<String, dynamic> json) => UserRating(
//         id: json["_id"],
//         rating: json["rating"].toDouble(),
//         stand: standEnumValues.map[json["stand"]],
//         opinion: json["opinion"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "rating": rating,
//         "stand": standEnumValues.reverse[stand],
//         "opinion": opinion,
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//     };
// }

// class DatumVideo {
//     DatumVideo({
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
//         this.folder,
//     });

//     String id;
//     bool used;
//     bool deleted;
//     bool uploading;
//     String createdBy;
//     String name;
//     int size;
//     String file;
//     Mimetype mimetype;
//     String thumbnail;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     int duration;
//     Folder folder;

//     factory DatumVideo.fromMap(Map<String, dynamic> json) => DatumVideo(
//         id: json["_id"],
//         used: json["used"],
//         deleted: json["deleted"],
//         uploading: json["uploading"],
//         createdBy: json["createdBy"],
//         name: json["name"],
//         size: json["size"],
//         file: json["file"],
//         mimetype: mimetypeValues.map[json["mimetype"]],
//         thumbnail: json["thumbnail"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         duration: json["duration"],
//         folder: json["folder"] == null ? null : folderValues.map[json["folder"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "used": used,
//         "deleted": deleted,
//         "uploading": uploading,
//         "createdBy": createdBy,
//         "name": name,
//         "size": size,
//         "file": file,
//         "mimetype": mimetypeValues.reverse[mimetype],
//         "thumbnail": thumbnail,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "duration": duration,
//         "folder": folder == null ? null : folderValues.reverse[folder],
//     };
// }

// enum Folder { THE_5_F4478198_BE6_A211_B2_BC935_F }

// final folderValues = EnumValues({
//     "5f4478198be6a211b2bc935f": Folder.THE_5_F4478198_BE6_A211_B2_BC935_F
// });

// enum Mimetype { VIDEO_MP4, VIDEO_QUICKTIME }

// final mimetypeValues = EnumValues({
//     "video/mp4": Mimetype.VIDEO_MP4,
//     "video/quicktime": Mimetype.VIDEO_QUICKTIME
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
