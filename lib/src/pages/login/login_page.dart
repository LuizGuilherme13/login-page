import 'package:flutter/material.dart';
import 'package:login_page/src/pages/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF27272A),
      body: Container(
        padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
        child: LoginForm(
          formKey: _formKey,
        ),
      ),
    );
  }
}
