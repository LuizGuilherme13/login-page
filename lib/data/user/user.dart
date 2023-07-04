import 'dart:convert';

String userDataJson = '''
  {
    "user":[
      {
        "id": 1,
        "email": "dev1@example.com",
        "password": "123"
      },
            {
        "id": 2,
        "email": "dev2@example.com",
        "password": "abc321"
      },
      {
        "id": 3,
        "email": "dev3@example.com",
        "password": "admin123"
      }
    ]
  }
''';
Map<String, dynamic> userData = jsonDecode(userDataJson);

String userInfoJson = '''
 {
   "user_info": [
      {
        "info": {
          "user_id": 1,
          "name": "Luiz",
          "username": "johndoe",
          "avatar": "",
          "age": 21,
          "city": "Jussara",
          "country": "Brazil"
        }
      },
      {
        "info": {
          "user_id": 2,
          "name": "Dev 2",
          "username": "dev2",
          "avatar": "",
          "age": 20,
          "city": "New York",
          "country": "United States"
        }
      },
      {
        "info": {
          "user_id": 3,
          "name": "Dev 3",
          "username": "dev3",
          "avatar": "",
          "age": 20,
          "city": "New York",
          "country": "United States"
        }
      }
    ]
}
''';
Map<String, dynamic> userInfo = jsonDecode(userInfoJson);
