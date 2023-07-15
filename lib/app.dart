import 'package:flutter/material.dart';
import 'package:login_page/src/pages/home/home_page.dart';
import 'package:login_page/src/pages/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primarySwatch: Color(0xFF064E3B)),
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => const HomePage()
        },
        // home: const LoginPage(),
      ),
    );
  }
}
