import 'package:flutter/material.dart';
import 'package:routing/pages/login.page.dart';
import 'package:routing/pages/register.page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        // '/register': (context) => RegisterPage(),
      },
    );
  }
}
