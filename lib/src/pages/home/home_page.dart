import 'package:flutter/material.dart';
import 'package:login_page/data/models/login.dart';
import 'package:login_page/src/pages/login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginResponse? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoginResponse receivedResponse =
          ModalRoute.of(context)!.settings.arguments as LoginResponse;
      setState(() {
        user = receivedResponse;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF27272A),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2E8F0),
        iconTheme: const IconThemeData(color: Color(0xFF064E3B)),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFE2E8F0),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF064E3B)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('${user?.image}'),
              ),
              accountName: Text('${user?.firstName} ${user?.lastName}'),
              accountEmail: Text('${user?.email}'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ],
        ),
      ),
      body: Center(
        child: user == null
            ? const CircularProgressIndicator()
            : Center(
                child: Text(
                'Welcome ${user?.firstName}!',
                style: TextStyle(color: Color(0xFFf5f5f5)),
              )),
      ),
    );
  }
}
