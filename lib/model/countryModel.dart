class CountryModel {
    CountryModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
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
    });

    String id;
    String name;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
