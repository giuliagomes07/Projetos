import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'widgets/custom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runZonedGuarded(() async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(MaterialApp(
        home: const Home(),
        theme: ThemeData(
            hintColor: const Color.fromARGB(255, 25, 29, 36),
            primaryColor: Colors.white)));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
