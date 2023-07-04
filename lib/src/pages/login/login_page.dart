import 'package:flutter/material.dart';
import 'package:login_page/data/models/login.dart';
import 'package:login_page/data/user/user.dart';
import 'package:login_page/src/pages/login/widgets/custom_text_input.dart';
import 'package:login_page/src/shared/widgets/block_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      LoginResponse? data = _findUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (data != null) {
        goToHome();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect email or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: Container(
          padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
          child: Column(
            children: [
              const SizedBox(
                child: Text('banky',
                    style: TextStyle(
                      color: Color(0xFF22C55E),
                      fontSize: 32,
                      fontFamily: 'RaleWay',
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 45),
              CustomTextInput(
                controller: _emailController,
                label: 'Email',
                validator: _validateEmail,
              ),
              const SizedBox(height: 24),
              CustomTextInput(
                controller: _passwordController,
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 32),
              BlockButton(
                icon: Icons.login,
                label: 'Login',
                onPressed: () {
                  _submitForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid email';
  }
  return null;
}

LoginResponse? _findUser({required String email, required String password}) {
  List<dynamic> users = userData['user'];
  List<dynamic> infos = userInfo['user_info'];

  for (var user in users) {
    var userID = user['id'];

    if (user['email'] == email && user['password'] == password) {
      var matchingInfo = infos.firstWhere(
        (info) => info['info']['user_id'] == userID,
        orElse: () => null,
      );

      return LoginResponse(user: User.fromJson(matchingInfo));
    }
  }
  return null;
}
