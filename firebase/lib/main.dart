import 'package:firebase/pages/auth_page.dart';
import 'package:firebase/widgets/route_screen_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<AuthService>(
      create: (context) => AuthService(),
      child: const Welcome(),
    ),
  );
}
