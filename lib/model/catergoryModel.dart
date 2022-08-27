class CategoryModel {
    CategoryModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
        this.name,
        this.profilePic,
        this.subcategories,
        this.associatedBusiness,
    });

    String id;
    String name;
    String profilePic;
    List<Subcategory> subcategories;
    AssociatedBusiness associatedBusiness;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        profilePic: json["profilePic"],
        subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
        associatedBusiness: json["associatedBusiness"] == null ? null : AssociatedBusiness.fromJson(json["associatedBusiness"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "profilePic": profilePic,
        "subcategories": List<dynamic>.from(subcategories.map((x) => x.toJson())),
        "associatedBusiness": associatedBusiness == null ? null : associatedBusiness.toJson(),
    };
}

class AssociatedBusiness {
    AssociatedBusiness({
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
        this.hostName,
        this.email,
        this.position,
        this.firstname,
        this.lastname,
        this.phoneNumber,
        this.countryCode,
        this.countryCodeIso2,
        this.invoiceNumber,
        this.businessWebsite,
        this.profilePic,
        this.businessDetails,
        this.supportedCategories,
        this.role,
        this.plan,
        this.contacts,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.activityMovement,
        this.lastLogin,
        this.aboutUs,
        this.cover,
        this.displayName,
        this.opinions,
        this.videos,
        this.associatedBusinessId,
    });

    dynamic income;
    Completion completion;
    Settings settings;
    bool verified;
    bool paid;
    bool agreeTerms;
    List<dynamic> languagesSpoken;
    List<String> followers;
    List<dynamic> following;
    List<dynamic> topicOfInterests;
    List<String> subCategories;
    List<dynamic> countriesFollowing;
    List<dynamic> statesFollowing;
    List<dynamic> citiesFollowing;
    int storage;
    List<dynamic> countriesToShow;
    double activityScore;
    bool subscription;
    List<String> keywordsToWatch;
    bool auto;
    String id;
    String username;
    String hostName;
    String email;
    String position;
    String firstname;
    String lastname;
    String phoneNumber;
    String countryCode;
    String countryCodeIso2;
    String invoiceNumber;
    List<BusinessWebsite> businessWebsite;
    String profilePic;
    BusinessDetails businessDetails;
    List<SupportedCategory> supportedCategories;
    String role;
    String plan;
    List<dynamic> contacts;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String activityMovement;
    DateTime lastLogin;
    String aboutUs;
    String cover;
    String displayName;
    dynamic opinions;
    dynamic videos;
    String associatedBusinessId;

    factory AssociatedBusiness.fromJson(Map<String, dynamic> json) => AssociatedBusiness(
        income: json["income"],
        completion: Completion.fromJson(json["completion"]),
        settings: Settings.fromJson(json["settings"]),
        verified: json["verified"],
        paid: json["paid"],
        agreeTerms: json["agreeTerms"],
        languagesSpoken: List<dynamic>.from(json["languagesSpoken"].map((x) => x)),
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        topicOfInterests: List<dynamic>.from(json["topicOfInterests"].map((x) => x)),
        subCategories: List<String>.from(json["subCategories"].map((x) => x)),
        countriesFollowing: List<dynamic>.from(json["countriesFollowing"].map((x) => x)),
        statesFollowing: List<dynamic>.from(json["statesFollowing"].map((x) => x)),
        citiesFollowing: List<dynamic>.from(json["citiesFollowing"].map((x) => x)),
        storage: json["storage"],
        countriesToShow: List<dynamic>.from(json["countriesToShow"].map((x) => x)),
        activityScore: json["activityScore"].toDouble(),
        subscription: json["subscription"],
        keywordsToWatch: List<String>.from(json["keywordsToWatch"].map((x) => x)),
        auto: json["auto"],
        id: json["_id"],
        username: json["username"],
        hostName: json["hostName"],
        email: json["email"],
        position: json["position"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phoneNumber: json["phoneNumber"],
        countryCode: json["countryCode"],
        countryCodeIso2: json["countryCodeIso2"],
        invoiceNumber: json["invoiceNumber"],
        businessWebsite: List<BusinessWebsite>.from(json["businessWebsite"].map((x) => BusinessWebsite.fromJson(x))),
        profilePic: json["profilePic"],
        businessDetails: BusinessDetails.fromJson(json["businessDetails"]),
        supportedCategories: List<SupportedCategory>.from(json["supportedCategories"].map((x) => SupportedCategory.fromJson(x))),
        role: json["role"],
        plan: json["plan"],
        contacts: List<dynamic>.from(json["contacts"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        activityMovement: json["activityMovement"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        aboutUs: json["aboutUs"],
        cover: json["cover"],
        displayName: json["displayName"],
        opinions: json["opinions"],
        videos: json["videos"],
        associatedBusinessId: json["id"],
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
        "hostName": hostName,
        "email": email,
        "position": position,
        "firstname": firstname,
        "lastname": lastname,
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "countryCodeIso2": countryCodeIso2,
        "invoiceNumber": invoiceNumber,
        "businessWebsite": List<dynamic>.from(businessWebsite.map((x) => x.toJson())),
        "profilePic": profilePic,
        "businessDetails": businessDetails.toJson(),
        "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x.toJson())),
        "role": role,
        "plan": plan,
        "contacts": List<dynamic>.from(contacts.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "activityMovement": activityMovement,
        "lastLogin": lastLogin.toIso8601String(),
        "aboutUs": aboutUs,
        "cover": cover,
        "displayName": displayName,
        "opinions": opinions,
        "videos": videos,
        "id": associatedBusinessId,
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

class Subcategory {
    Subcategory({
        this.status,
        this.tags,
        this.id,
        this.name,
        this.profilePic,
        this.description,
        this.associatedBusiness,
    });

    Status status;
    List<String> tags;
    String id;
    String name;
    String profilePic;
    String description;
    AssociatedBusiness associatedBusiness;

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        status: statusValues.map[json["status"]],
        tags: List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        description: json["description"] == null ? null : json["description"],
        associatedBusiness: json["associatedBusiness"] == null ? null : AssociatedBusiness.fromJson(json["associatedBusiness"]),
    );

    Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "_id": id,
        "name": name,
        "profilePic": profilePic == null ? null : profilePic,
        "description": description == null ? null : description,
        "associatedBusiness": associatedBusiness == null ? null : associatedBusiness.toJson(),
    };
}

enum Status { APPROVED }

final statusValues = EnumValues({
    "Approved": Status.APPROVED
});

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