// class ProfileModel {
//     ProfileModel({
//         this.income,
//         this.completion,
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
//         this.keywordsToWatch,
//         this.auto,
//         this.id,
//         this.username,
//         this.role,
//         this.displayLanguage,
//         this.displayName,
//         this.email,
//         this.plan,
//         this.salutation,
//         this.confirmId,
//         this.businessWebsite,
//         this.contacts,
//         this.supportedCategories,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.token,
//         this.activityMovement,
//         this.lastLogin,
//         this.profilePic,
//         this.opinions,
//         this.videos,
//         this.welcomeId,
//     });

//     dynamic income;
//     Completion completion;
//     Settings settings;
//     bool verified;
//     bool paid;
//     bool agreeTerms;
//     List<String> languagesSpoken;
//     List<dynamic> followers;
//     List<String> following;
//     List<dynamic> topicOfInterests;
//     List<String> subCategories;
//     List<String> countriesFollowing;
//     List<String> statesFollowing;
//     List<String> citiesFollowing;
//     int storage;
//     List<dynamic> countriesToShow;
//     double activityScore;
//     bool subscription;
//     List<dynamic> keywordsToWatch;
//     bool auto;
//     String id;
//     String username;
//     Role role;
//     String displayLanguage;
//     String displayName;
//     String email;
//     String plan;
//     String salutation;
//     String confirmId;
//     List<dynamic> businessWebsite;
//     List<Contact> contacts;
//     List<dynamic> supportedCategories;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     String token;
//     String activityMovement;
//     DateTime lastLogin;
//     String profilePic;
//     dynamic opinions;
//     dynamic videos;
//     String welcomeId;

//     factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
//         income: json["income"],
//         completion: Completion.fromJson(json["completion"]),
//         settings: Settings.fromJson(json["settings"]),
//         verified: json["verified"],
//         paid: json["paid"],
//         agreeTerms: json["agreeTerms"],
//         languagesSpoken: List<String>.from(json["languagesSpoken"].map((x) => x)),
//         followers: List<dynamic>.from(json["followers"].map((x) => x)),
//         following: List<String>.from(json["following"].map((x) => x)),
//         topicOfInterests: List<dynamic>.from(json["topicOfInterests"].map((x) => x)),
//         subCategories: List<String>.from(json["subCategories"].map((x) => x)),
//         countriesFollowing: List<String>.from(json["countriesFollowing"].map((x) => x)),
//         statesFollowing: List<String>.from(json["statesFollowing"].map((x) => x)),
//         citiesFollowing: List<String>.from(json["citiesFollowing"].map((x) => x)),
//         storage: json["storage"],
//         countriesToShow: List<dynamic>.from(json["countriesToShow"].map((x) => x)),
//         activityScore: json["activityScore"].toDouble(),
//         subscription: json["subscription"],
//         keywordsToWatch: List<dynamic>.from(json["keywordsToWatch"].map((x) => x)),
//         auto: json["auto"],
//         id: json["_id"],
//         username: json["username"],
//         role: Role.fromJson(json["role"]),
//         displayLanguage: json["displayLanguage"],
//         displayName: json["displayName"],
//         email: json["email"],
//         plan: json["plan"],
//         salutation: json["salutation"],
//         confirmId: json["confirmId"],
//         businessWebsite: List<dynamic>.from(json["businessWebsite"].map((x) => x)),
//         contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
//         supportedCategories: List<dynamic>.from(json["supportedCategories"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         token: json["token"],
//         activityMovement: json["activityMovement"],
//         lastLogin: DateTime.parse(json["lastLogin"]),
//         profilePic: json["profilePic"],
//         opinions: json["opinions"],
//         videos: json["videos"],
//         welcomeId: json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "income": income,
//         "completion": completion.toJson(),
//         "settings": settings.toJson(),
//         "verified": verified,
//         "paid": paid,
//         "agreeTerms": agreeTerms,
//         "languagesSpoken": List<dynamic>.from(languagesSpoken.map((x) => x)),
//         "followers": List<dynamic>.from(followers.map((x) => x)),
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
//         "keywordsToWatch": List<dynamic>.from(keywordsToWatch.map((x) => x)),
//         "auto": auto,
//         "_id": id,
//         "username": username,
//         "role": role.toJson(),
//         "displayLanguage": displayLanguage,
//         "displayName": displayName,
//         "email": email,
//         "plan": plan,
//         "salutation": salutation,
//         "confirmId": confirmId,
//         "businessWebsite": List<dynamic>.from(businessWebsite.map((x) => x)),
//         "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
//         "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x)),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "token": token,
//         "activityMovement": activityMovement,
//         "lastLogin": lastLogin.toIso8601String(),
//         "profilePic": profilePic,
//         "opinions": opinions,
//         "videos": videos,
//         "id": welcomeId,
//     };
// }

// class Completion {
//     Completion({
//         this.percentage,
//         this.title,
//     });

//     int percentage;
//     String title;

//     factory Completion.fromJson(Map<String, dynamic> json) => Completion(
//         percentage: json["percentage"],
//         title: json["title"],
//     );

//     Map<String, dynamic> toJson() => {
//         "percentage": percentage,
//         "title": title,
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

//     factory Contact.fromJson(Map<String, dynamic> json) => Contact(
//         id: json["_id"],
//         user: json["user"],
//         room: json["room"],
//         lastRead: DateTime.parse(json["lastRead"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "user": user,
//         "room": room,
//         "lastRead": lastRead.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdAt": createdAt.toIso8601String(),
//     };
// }

// class Role {
//     Role({
//         this.modules,
//         this.isAdmin,
//         this.id,
//         this.name,
//     });

//     List<String> modules;
//     bool isAdmin;
//     String id;
//     String name;

//     factory Role.fromJson(Map<String, dynamic> json) => Role(
//         modules: List<String>.from(json["modules"].map((x) => x)),
//         isAdmin: json["isAdmin"],
//         id: json["_id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "modules": List<dynamic>.from(modules.map((x) => x)),
//         "isAdmin": isAdmin,
//         "_id": id,
//         "name": name,
//     };
// }

// class Settings {
//     Settings({
//         this.showOccupation,
//         this.useLocation,
//     });

//     bool showOccupation;
//     bool useLocation;

//     factory Settings.fromJson(Map<String, dynamic> json) => Settings(
//         showOccupation: json["showOccupation"],
//         useLocation: json["useLocation"],
//     );

//     Map<String, dynamic> toJson() => {
//         "showOccupation": showOccupation,
//         "useLocation": useLocation,
//     };
// }


class ProfileModel {
    ProfileModel({
        this.income,
        this.completion,
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
        this.keywordsToWatch,
        this.auto,
        this.id,
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
        this.token,
        this.activityMovement,
        this.lastLogin,
        this.profilePic,
        this.countryCode,
        this.currency,
        this.dob,
        this.firstname,
        this.lastname,
        this.nationality,
        this.occupation,
        this.phoneNumber,
        this.religion,
        this.maritalStatus,
        this.opinions,
        this.videos,
        this.profileModelId,
    });

    dynamic income;
    Completion completion;
    Settings settings;
    bool verified;
    bool paid;
    bool agreeTerms;
    List<String> languagesSpoken;
    List<dynamic> followers;
    List<String> following;
    List<dynamic> topicOfInterests;
    List<String> subCategories;
    List<String> countriesFollowing;
    List<dynamic> statesFollowing;
    List<dynamic> citiesFollowing;
    int storage;
    List<dynamic> countriesToShow;
    int activityScore;
    bool subscription;
    List<dynamic> keywordsToWatch;
    bool auto;
    String id;
    String username;
    Role role;
    String displayLanguage;
    String displayName;
    String email;
    String plan;
    String salutation;
    String confirmId;
    List<dynamic> businessWebsite;
    List<Contact> contacts;
    List<dynamic> supportedCategories;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String token;
    String activityMovement;
    DateTime lastLogin;
    String profilePic;
    String countryCode;
    String currency;
    DateTime dob;
    String firstname;
    String lastname;
    String nationality;
    String occupation;
    String phoneNumber;
    String religion;
    String maritalStatus;
    dynamic opinions;
    dynamic videos;
    String profileModelId;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        income: json["income"],
        completion: Completion.fromJson(json["completion"]),
        settings: Settings.fromJson(json["settings"]),
        verified: json["verified"],
        paid: json["paid"],
        agreeTerms: json["agreeTerms"],
        languagesSpoken: List<String>.from(json["languagesSpoken"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        topicOfInterests: List<dynamic>.from(json["topicOfInterests"].map((x) => x)),
        subCategories: List<String>.from(json["subCategories"].map((x) => x)),
        countriesFollowing: List<String>.from(json["countriesFollowing"].map((x) => x)),
        statesFollowing: List<dynamic>.from(json["statesFollowing"].map((x) => x)),
        citiesFollowing: List<dynamic>.from(json["citiesFollowing"].map((x) => x)),
        storage: json["storage"],
        countriesToShow: List<dynamic>.from(json["countriesToShow"].map((x) => x)),
        activityScore: json["activityScore"],
        subscription: json["subscription"],
        keywordsToWatch: List<dynamic>.from(json["keywordsToWatch"].map((x) => x)),
        auto: json["auto"],
        id: json["_id"],
        username: json["username"],
        role: Role.fromJson(json["role"]),
        displayLanguage: json["displayLanguage"],
        displayName: json["displayName"],
        email: json["email"],
        plan: json["plan"],
        salutation: json["salutation"],
        confirmId: json["confirmId"],
        businessWebsite: List<dynamic>.from(json["businessWebsite"].map((x) => x)),
        contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
        supportedCategories: List<dynamic>.from(json["supportedCategories"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
        activityMovement: json["activityMovement"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        profilePic: json["profilePic"],
        countryCode: json["countryCode"],
        currency: json["currency"],
        dob: DateTime.parse(json["dob"]),
        firstname: json["firstname"] != null?json["firstname"]:"",
        lastname: json["lastname"] !=null ? json["lastname"]:"",
        nationality: json["nationality"] != null?json["nationality"]:"",
        occupation: json["occupation"] != null?json["occupation"]:"",
        phoneNumber: json["phoneNumber"] != null?json["phoneNumber"]:"",
        religion: json["religion"] != null?json["religion"]:"",
        maritalStatus: json["maritalStatus"] != null?json["maritalStatus"]:"",
        opinions: json["opinions"] != null?json["opinions"]:"",
        videos: json["videos"],
        profileModelId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "income": income,
        "completion": completion.toJson(),
        "settings": settings.toJson(),
        "verified": verified,
        "paid": paid,
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
        "subscription": subscription,
        "keywordsToWatch": List<dynamic>.from(keywordsToWatch.map((x) => x)),
        "auto": auto,
        "_id": id,
        "username": username,
        "role": role.toJson(),
        "displayLanguage": displayLanguage,
        "displayName": displayName,
        "email": email,
        "plan": plan,
        "salutation": salutation,
        "confirmId": confirmId,
        "businessWebsite": List<dynamic>.from(businessWebsite.map((x) => x)),
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
        "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "token": token,
        "activityMovement": activityMovement,
        "lastLogin": lastLogin.toIso8601String(),
        "profilePic": profilePic,
        "countryCode": countryCode,
        "currency": currency,
        "dob": dob.toIso8601String(),
        "firstname": firstname,
        "lastname": lastname,
        "nationality": nationality,
        "occupation": occupation,
        "phoneNumber": phoneNumber,
        "religion": religion,
        "maritalStatus": maritalStatus,
        "opinions": opinions,
        "videos": videos,
        "id": profileModelId,
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

class Role {
    Role({
        this.modules,
        this.isAdmin,
        this.id,
        this.name,
    });

    List<String> modules;
    bool isAdmin;
    String id;
    String name;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        modules: List<String>.from(json["modules"].map((x) => x)),
        isAdmin: json["isAdmin"],
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "modules": List<dynamic>.from(modules.map((x) => x)),
        "isAdmin": isAdmin,
        "_id": id,
        "name": name,
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
