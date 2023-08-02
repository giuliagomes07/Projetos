import 'package:firebase/pages/auth_page.dart';
import 'package:firebase/widgets/home_widget.dart';
import 'package:firebase/widgets/login_widget.dart';
import 'package:firebase/widgets/register_widget.dart';
import 'package:firebase/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const Welcome());

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Flutter Firebase Auth',
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => const WelcomeScreen(),
          '/': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
