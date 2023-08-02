import 'package:firebase/widgets/home_widget.dart';
import 'package:firebase/widgets/login_widget.dart';
import 'package:firebase/widgets/register_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check if is the right instance', () {
    final homeScreen = HomeScreen();

    expect(homeScreen, isInstanceOf<HomeScreen>());
  });

  test('Check if is the right instance', () {
    final loginScreen = LoginScreen();

    expect(loginScreen, isInstanceOf<LoginScreen>());
  });

  test('Check if is the right instance', () {
    final registerScreen = RegisterScreen();

    expect(registerScreen, isInstanceOf<RegisterScreen>());
  });
}
