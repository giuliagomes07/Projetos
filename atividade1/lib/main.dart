import 'package:atividade1/firebase_messaging/custom_firebase_messaging.dart';
import 'package:atividade1/remote_config/custom_remote_config.dart';
import 'package:atividade1/widgets/task_app_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CustomFirebaseMessaging().inicialize();

  await CustomRemoteConfig().initialize();

  runApp(const TarefaApp());
}
