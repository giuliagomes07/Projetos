import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'widgets/custom.dart';

void main() async {
  runZonedGuarded(() async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(MaterialApp(
        home: const Home(),
        theme: ThemeData(
            hintColor: const Color.fromARGB(255, 25, 29, 36),
            primaryColor: Colors.white)));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
