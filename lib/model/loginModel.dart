class LoginModel {
    LoginModel({
        this.username,
        this.password,
    });

    String username;
    String password;

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
    };
}