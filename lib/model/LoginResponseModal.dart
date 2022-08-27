class LoginResponse {
    LoginResponse({
        this.id,
        this.token,
        this.username,
        this.role,
        this.profilePic,
        this.firstLogin,
        this.plan,
        this.email,
        this.host,
        this.visitor,
        this.verified,
    });

    String id;
    String token;
    String username;
    Role role;
    String profilePic;
    bool firstLogin;
    Plan plan;
    String email;
    bool host;
    bool visitor;
    bool verified;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        token: json["token"],
        username: json["username"],
        role: Role.fromJson(json["role"]),
        profilePic: json["profilePic"],
        firstLogin: json["firstLogin"],
        plan: Plan.fromJson(json["plan"]),
        email: json["email"],
        host: json["host"],
        visitor: json["visitor"],
        verified: json["verified"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "token": token,
        "username": username,
        "role": role.toJson(),
        "profilePic": profilePic,
        "firstLogin": firstLogin,
        "plan": plan.toJson(),
        "email": email,
        "host": host,
        "visitor": visitor,
        "verified": verified,
    };
}

class Plan {
    Plan({
        this.options,
        this.access,
        this.id,
        this.name,
        this.pricing,
        this.business,
        this.v,
        this.usersNumber,
        this.videoSeconds,
    });

    Optionss options;
    List<String> access;
    String id;
    String name;
    List<Pricing> pricing;
    bool business;
    int v;
    int usersNumber;
    int videoSeconds;

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        options: Optionss.fromJson(json["options"]),
        access: List<String>.from(json["access"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        pricing: List<Pricing>.from(json["pricing"].map((x) => Pricing.fromJson(x))),
        business: json["business"],
        v: json["__v"],
        usersNumber: json["usersNumber"],
        videoSeconds: json["videoSeconds"],
    );

    Map<String, dynamic> toJson() => {
        "options": options.toJson(),
        "access": List<dynamic>.from(access.map((x) => x)),
        "_id": id,
        "name": name,
        "pricing": List<dynamic>.from(pricing.map((x) => x.toJson())),
        "business": business,
        "__v": v,
        "usersNumber": usersNumber,
        "videoSeconds": videoSeconds,
    };
}

class Optionss {
    Optionss({
        this.storage,
        this.monthlyPosts,
        this.analytics1,
        this.analytics2,
    });

    int storage;
    int monthlyPosts;
    bool analytics1;
    bool analytics2;

    factory Optionss.fromJson(Map<String, dynamic> json) => Optionss(
        storage: json["storage"],
        monthlyPosts: json["monthlyPosts"],
        analytics1: json["analytics1"],
        analytics2: json["analytics2"],
    );

    Map<String, dynamic> toJson() => {
        "storage": storage,
        "monthlyPosts": monthlyPosts,
        "analytics1": analytics1,
        "analytics2": analytics2,
    };
}

class Pricing {
    Pricing({
        this.id,
        this.country,
        this.price,
    });

    String id;
    String country;
    int price;

    factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        id: json["_id"],
        country: json["country"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "country": country,
        "price": price,
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