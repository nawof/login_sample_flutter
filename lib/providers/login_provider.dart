import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_statefull/pages/home_page.dart';

enum PassStrongIndex {
  weak,
  medium,
  strong,
}

class LoginProvider extends ChangeNotifier {
  final BuildContext context;
  final String title;

  String? email;
  String? phoneNumber;
  String? password;

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passController = TextEditingController();

  LoginProvider({
    required this.context,
    required this.title,
  });

  void saveUserEmail() {
    email = emailController.text;
  }

  void saveUserNumber() {
    phoneNumber = phoneNumberController.text;
  }

  void saveUserPassword() {
    password = passController.text;
    saveUserEmail();
    saveUserNumber();

    if (email != null && !validateEmail(email!)) {
      showErrorMessage('Invalid email');
      return;
    }

    if (phoneNumber != null && !validatePhoneNumber(phoneNumber!)) {
      showErrorMessage('Invalid phone number');
      return;
    }

    if (password != null && !isPassStrong(password!)) {
      showErrorMessage('Weak password');
      return;
    }

    notifyListeners();
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String getEmail() {
    return inputChecker(email);
  }

  String getPhoneNum() {
    return inputChecker(phoneNumber);
  }

  String getPass() {
    return inputChecker(password);
  }

  String inputChecker(String? value) {
    return (value == null) ? 'Should not be empty' : value;
  }

  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validatePhoneNumber(String phoneNumber) {
    // String PhoneNumber = phoneNumber;

    if (phoneNumber.length < 11) {
      return false;
    } else if (!phoneNumber.startsWith('09')) {
      return false;
    }

    return true;
  }

  bool isPassStrong(String password) {
    if (password.length <= 4) {
      // it should say your password is weak
      return false;
    }

    if (password.length <= 6) {
      // it should say your password is medium
      return false;
    }

    if (password.length >= 6) {
      if (hasAlphabetCharacters(password) && hasNumberCharacters(password)) {
        RegExp specialCharactersRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
        return specialCharactersRegex.hasMatch(password);
      }
      // here password is strong enough
      return false;
    }

    return false;
  }

  bool hasAlphabetCharacters(String password) {
    RegExp alphabetsRegex = RegExp(r'[a-zA-Z]');
    return alphabetsRegex.hasMatch(password);
  }

  bool hasNumberCharacters(String password) {
    RegExp numbersRegex = RegExp(r'[0-9]');
    return numbersRegex.hasMatch(password);
  }

  void goToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
