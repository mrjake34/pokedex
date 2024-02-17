import 'package:flutter/material.dart';

final class User extends ChangeNotifier {
  String? name;
  String? email;
  String? password;

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}
