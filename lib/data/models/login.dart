class LoginResponse {
  User user;

  LoginResponse({required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(user: User.fromJson(json['user_info']));
}

class User {
  Info info;

  User({required this.info});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(info: Info.fromJson(json['info']));
}

class Info {
  int id;
  String name;
  String username;
  String avatar;
  int age;
  String city;
  String country;

  Info({
    required this.id,
    required this.name,
    required this.username,
    required this.avatar,
    required this.age,
    required this.city,
    required this.country,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
      id: json['user_id'],
      name: json['name'],
      username: json['username'],
      avatar: json['avatar'],
      age: json['age'],
      city: json['city'],
      country: json['country']);
}
