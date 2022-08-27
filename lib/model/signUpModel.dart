class SignUpModel {
    SignUpModel({
        this.email,
        this.password,
        this.username,
        this.firstname,
        this.lastname,
    });

    String email;
    String password;
    String username;
    String firstname;
    String lastname;

    factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
        email: json["email"],
        password: json["password"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname "],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "username": username,
        "firstname": firstname,
        "lastname ": lastname,
    };
}