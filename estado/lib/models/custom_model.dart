import 'package:estado/util/util.dart';
import 'package:flutter/material.dart';

class Customer extends ChangeNotifier {
  String fullName;
  String email;
  CustomerType customerType;

  Customer({
    required this.fullName,
    required this.email,
    required this.customerType,
  });

  void updateInfo({
    required String newName,
    required String newEmail,
    required CustomerType newCustomerType,
  }) {
    fullName = newName;
    email = newEmail;
    customerType = newCustomerType;
    notifyListeners();
  }
}
