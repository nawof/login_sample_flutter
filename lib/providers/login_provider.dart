import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_statefull/pages/home_page.dart';

import '../constants/errors/my_error.dart';

enum PassStrongIndex {
  weak,
  medium,
  strong,
}

class LoginProvider extends ChangeNotifier {
  final BuildContext context;
  final String title;
  final formKey = GlobalKey<FormState>();
  String? email;
  String? phoneNumber;
  String? password;
  PassStrongIndex passStrongIndex = PassStrongIndex.weak;
  final Map<PassStrongIndex, Color> passStrongColorMap = {
    PassStrongIndex.weak: Colors.red,
    PassStrongIndex.medium: Colors.orange,
    PassStrongIndex.strong: Colors.green,
  };
  final Map<PassStrongIndex, double> passStrongProgressMap = {
    PassStrongIndex.weak: 1 / 3,
    PassStrongIndex.medium: 2 / 3,
    PassStrongIndex.strong: 1,
  };

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

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

  void onChangePass(String value) {
    password = value;
    passStrongIndex = getPassStrongIndex(password ?? '');
    notifyListeners();
  }

  void saveUserPassword() {
    saveUserEmail();
    saveUserNumber();
    notifyListeners();
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String? validateEmail(String? email) {
    if (email == null) {
      MyError.invalidEmailError;
    }
    if (EmailValidator.validate(email!)) {
      return null;
    }
    return MyError.invalidEmailError;
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null) {
      MyError.invalidPhoneNumberError;
    }
    if (phoneNumber!.startsWith('09')) {
      if (phoneNumber.length < 11) {
        return MyError.invalidPhoneNumberError;
      }
    } else if (phoneNumber.startsWith('+98')) {
      if (phoneNumber.length < 13) {
        return MyError.invalidPhoneNumberError;
      }
    }
    return null;
  }

  PassStrongIndex getPassStrongIndex(String password) {
    if (isStorngPass(password)) {
      return PassStrongIndex.strong;
    } else if (isMidPass(password)) {
      return PassStrongIndex.medium;
    }

    return PassStrongIndex.weak;
  }

  bool isStorngPass(String password) {
    if (password.length >= 8 && hasAlphabetCharacters(password) && hasNumberCharacters(password) && hasSpecialCharacters(password)) {
      return true;
    }
    return false;
  }

  bool isMidPass(String password) {
    if (password.length <= 8) {
      return false;
    }
    return true;
  }

  bool hasAlphabetCharacters(String password) {
    RegExp alphabetsRegex = RegExp(r'[a-zA-Z]');
    return alphabetsRegex.hasMatch(password);
  }

  bool hasNumberCharacters(String password) {
    RegExp numbersRegex = RegExp(r'[0-9]');
    return numbersRegex.hasMatch(password);
  }

  bool hasSpecialCharacters(String password) {
    RegExp specialCharactersRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return specialCharactersRegex.hasMatch(password);
  }

  void goToLoginPage() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
