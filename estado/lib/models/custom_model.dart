import 'package:flutter/material.dart';

class Customer extends ChangeNotifier {
  final String fullName;
  final String email;
  final String customerType;

  Customer({
    required this.fullName,
    required this.email,
    required this.customerType,
  });
}
