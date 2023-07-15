import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:login_page/data/models/login.dart';
import 'package:login_page/data/repository/login_repository.dart';

void submitForm({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String user,
  required String password,
}) {
  if (formKey.currentState!.validate()) {
    Future<LoginResponse?> loginResponseFuture =
        login(user: user, password: password);

    loginResponseFuture.then(
      (LoginResponse? loginResponse) => {
        if (loginResponse != null)
          {
            Navigator.pushReplacementNamed(context, '/home',
                arguments: loginResponse)
          }
        else
          {
            FocusScope.of(context).unfocus(),
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'Oh no, an error!',
                    message: 'Incorrect email and/or password',
                    messageFontSize: 14,
                    contentType: ContentType.failure,
                  ),
                ),
              ),
          }
      },
    );
  }
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  return null;
}
