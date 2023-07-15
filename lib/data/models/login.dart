class LoginResponse {
  int id;
  String userName;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;

  LoginResponse({
    required this.id,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json['id'],
        userName: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        image: json['image'],
        token: json['token'],
      );
}
