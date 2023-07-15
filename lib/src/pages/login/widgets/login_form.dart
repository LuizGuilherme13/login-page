import 'package:flutter/material.dart';
import 'package:login_page/src/pages/login/validation/on_submit_form.dart';
import 'package:login_page/src/pages/login/widgets/form_input.dart';
import 'package:login_page/src/shared/widgets/block_button.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.formKey,
  });

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const SizedBox(
            child: Text(
              'banky',
              style: TextStyle(
                color: Color(0xFF064E3B),
                fontSize: 32,
                fontFamily: 'RaleWay',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 45),
          FormInput(
            controller: _emailController,
            label: 'User',
            validator: validateEmail,
          ),
          const SizedBox(height: 24),
          FormInput(
            controller: _passwordController,
            label: 'Password',
            validator: validatePassword,
            obscureText: true,
          ),
          const SizedBox(height: 64),
          BlockButton(
            icon: Icons.login,
            label: 'Login',
            onPressed: () {
              submitForm(
                context: context,
                formKey: widget.formKey,
                user: _emailController.text,
                password: _passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
