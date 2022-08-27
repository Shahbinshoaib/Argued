class StatesModel {
    StatesModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
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
        this.cities,
        this.stateId,
    });

    String id;
    String name;
    List<City> cities;
    String stateId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
        stateId: json["stateId"] == null ? null : json["stateId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
        "stateId": stateId == null ? null : stateId,
    };
}

class City {
    City({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
