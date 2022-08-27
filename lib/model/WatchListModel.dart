class WatchListModel {
    WatchListModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    Data data;
    String message;
    String key;
    int code;

    factory WatchListModel.fromJson(Map<String, dynamic> json) => WatchListModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        key: json["key"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "key": key,
        "code": code,
    };
}

class Data {
    Data({
        this.id,
        this.settings,
        this.verified,
        this.paid,
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
        this.subscription,
        this.username,
        this.role,
        this.displayLanguage,
        this.displayName,
        this.email,
        this.plan,
        this.salutation,
        this.confirmId,
        this.businessWebsite,
        this.contacts,
        this.supportedCategories,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.geoPreference,
        this.income,
        this.completion,
        this.token,
        this.activityMovement,
        this.lastLogin,
        this.profilePic,
        this.keywordsToWatch,
        this.auto,
        this.subcats,
        this.host,
        this.visitor,
    });

    String id;
    Settings settings;
    bool verified;
    bool paid;
    bool agreeTerms;
    List<String> languagesSpoken;
    List<dynamic> followers;
    List<Following> following;
    List<dynamic> topicOfInterests;
    List<String> subCategories;
    List<String> countriesFollowing;
    List<String> statesFollowing;
    List<String> citiesFollowing;
    int storage;
    List<dynamic> countriesToShow;
    double activityScore;
    bool subscription;
    String username;
    Role role;
    String displayLanguage;
    String displayName;
    String email;
    Plan plan;
    String salutation;
    String confirmId;
    List<dynamic> businessWebsite;
    List<Contact> contacts;
    List<dynamic> supportedCategories;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    GeoPreference geoPreference;
    dynamic income;
    Completion completion;
    String token;
    String activityMovement;
    DateTime lastLogin;
    String profilePic;
    List<dynamic> keywordsToWatch;
    bool auto;
    String subcats;
    bool host;
    bool visitor;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        settings: Settings.fromJson(json["settings"]),
        verified: json["verified"],
        paid: json["paid"],
        agreeTerms: json["agreeTerms"],
        languagesSpoken: List<String>.from(json["languagesSpoken"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<Following>.from(json["following"].map((x) => Following.fromJson(x))),
        topicOfInterests: List<dynamic>.from(json["topicOfInterests"].map((x) => x)),
        subCategories: List<String>.from(json["subCategories"].map((x) => x)),
        countriesFollowing: List<String>.from(json["countriesFollowing"].map((x) => x)),
        statesFollowing: List<String>.from(json["statesFollowing"].map((x) => x)),
        citiesFollowing: List<String>.from(json["citiesFollowing"].map((x) => x)),
        storage: json["storage"],
        countriesToShow: List<dynamic>.from(json["countriesToShow"].map((x) => x)),
        activityScore: json["activityScore"].toDouble(),
        subscription: json["subscription"],
        username: json["username"],
        role: Role.fromJson(json["role"]),
        displayLanguage: json["displayLanguage"],
        displayName: json["displayName"],
        email: json["email"],
        plan: Plan.fromJson(json["plan"]),
        salutation: json["salutation"],
        confirmId: json["confirmId"],
        businessWebsite: List<dynamic>.from(json["businessWebsite"].map((x) => x)),
        contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
        supportedCategories: List<dynamic>.from(json["supportedCategories"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        geoPreference: GeoPreference.fromJson(json["geoPreference"]),
        income: json["income"],
        completion: Completion.fromJson(json["completion"]),
        token: json["token"],
        activityMovement: json["activityMovement"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        profilePic: json["profilePic"],
        keywordsToWatch: List<dynamic>.from(json["keywordsToWatch"].map((x) => x)),
        auto: json["auto"],
        subcats: json["subcats"],
        host: json["host"],
        visitor: json["visitor"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "settings": settings.toJson(),
        "verified": verified,
        "paid": paid,
        "agreeTerms": agreeTerms,
        "languagesSpoken": List<dynamic>.from(languagesSpoken.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x.toJson())),
        "topicOfInterests": List<dynamic>.from(topicOfInterests.map((x) => x)),
        "subCategories": List<dynamic>.from(subCategories.map((x) => x)),
        "countriesFollowing": List<dynamic>.from(countriesFollowing.map((x) => x)),
        "statesFollowing": List<dynamic>.from(statesFollowing.map((x) => x)),
        "citiesFollowing": List<dynamic>.from(citiesFollowing.map((x) => x)),
        "storage": storage,
        "countriesToShow": List<dynamic>.from(countriesToShow.map((x) => x)),
        "activityScore": activityScore,
        "subscription": subscription,
        "username": username,
        "role": role.toJson(),
        "displayLanguage": displayLanguage,
        "displayName": displayName,
        "email": email,
        "plan": plan.toJson(),
        "salutation": salutation,
        "confirmId": confirmId,
        "businessWebsite": List<dynamic>.from(businessWebsite.map((x) => x)),
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
        "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "geoPreference": geoPreference.toJson(),
        "income": income,
        "completion": completion.toJson(),
        "token": token,
        "activityMovement": activityMovement,
        "lastLogin": lastLogin.toIso8601String(),
        "profilePic": profilePic,
        "keywordsToWatch": List<dynamic>.from(keywordsToWatch.map((x) => x)),
        "auto": auto,
        "subcats": subcats,
        "host": host,
        "visitor": visitor,
    };
}

class Completion {
    Completion({
        this.percentage,
        this.title,
    });

    int percentage;
    String title;

    factory Completion.fromJson(Map<String, dynamic> json) => Completion(
        percentage: json["percentage"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "title": title,
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

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["_id"],
        user: json["user"],
        room: json["room"],
        lastRead: DateTime.parse(json["lastRead"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "room": room,
        "lastRead": lastRead.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}

class Following {
    Following({
        this.id,
        this.username,
        this.profilePic,
    });

    String id;
    String username;
    String profilePic;

    factory Following.fromJson(Map<String, dynamic> json) => Following(
        id: json["_id"],
        username: json["username"],
        profilePic: json["profilePic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "profilePic": profilePic,
    };
}

class GeoPreference {
    GeoPreference();

    factory GeoPreference.fromJson(Map<String, dynamic> json) => GeoPreference(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Plan {
    Plan({
        this.id,
        this.access,
        this.videosCount,
        this.allowedSize,
        this.name,
        this.v,
    });

    String id;
    List<dynamic> access;
    int videosCount;
    int allowedSize;
    String name;
    int v;

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["_id"],
        access: List<dynamic>.from(json["access"].map((x) => x)),
        videosCount: json["videosCount"],
        allowedSize: json["allowedSize"],
        name: json["name"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "access": List<dynamic>.from(access.map((x) => x)),
        "videosCount": videosCount,
        "allowedSize": allowedSize,
        "name": name,
        "__v": v,
    };
}

class Role {
    Role({
        this.id,
        this.name,
        this.modules,
    });

    String id;
    String name;
    List<dynamic> modules;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        modules: List<dynamic>.from(json["modules"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "modules": List<dynamic>.from(modules.map((x) => x)),
    };
}

class Settings {
    Settings({
        this.showOccupation,
        this.useLocation,
    });

    bool showOccupation;
    bool useLocation;

    factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        showOccupation: json["showOccupation"],
        useLocation: json["useLocation"],
    );

    Map<String, dynamic> toJson() => {
        "showOccupation": showOccupation,
        "useLocation": useLocation,
    };
}
