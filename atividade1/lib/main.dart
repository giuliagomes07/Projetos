import 'package:atividade1/widgets/task_app_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //await CustomFirebaseMessaging().inicialize();

  //CustomFirebaseMessaging().getTokenFirebase;

  runApp(const TarefaApp());
}
