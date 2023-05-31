import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_statefull/pages/home_page.dart';

enum PassStrongIndex {
  weak,
  medium,
  strong,
  veryStrong,
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

  void _saveUserEmail() {
    email = emailController.text;
  }

  void _saveUserNumber() {
    phoneNumber = phoneNumberController.text;
  }

  void saveUserPassword() {
    password = passController.text;
    _saveUserEmail();
    _saveUserNumber();

    if (email != null && !validateEmail(email!)) {
      // Show an error message for invalid email
      // For example, you can use a snackbar or dialog to display the error message
      showErrorMessage('Invalid email');
      return;
    }

    if (phoneNumber != null && !validatePhoneNumber(phoneNumber!)) {
      // Show an error message for invalid phone number
      // For example, you can use a snackbar or dialog to display the error message
      showErrorMessage('Invalid phone number');
      return;
    }

    // if (password != null && !isPassStrong(password!)) {
    //   // Show an error message for weak password
    //   // For example, you can use a snackbar or dialog to display the error message
    //   showErrorMessage('Weak password');
    //   return;
    // }

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
    // Remove any non-digit characters from the phone number
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (cleanedPhoneNumber.length < 11) {
      return false;
    } else if (!cleanedPhoneNumber.startsWith('09')) {
      return false;
    }

    return true;
  }

  ///
  ///[pass] this is the password method and shuold check strong index
  ///
  ///return weak if just have 4 characters
  ///
  ///return medium if have 6 characters
  ///
  ///return strong if contains medium requirements and also had both number characters and alphabet characters
  ///
  ///return very strong if contains strong requirements and also had special characters
  // PassStrongIndex isPassStrong(String password) {
  //   //TODO: implement

  //   if (password == null) {
  //     return;
  //   }

  //   return PassStrongIndex.medium;
  // }

  PassStrongIndex isPassStrong(String password) {
    if (password == null) {
      return PassStrongIndex.weak;
    }

    if (password.length >= 4) {
      return PassStrongIndex.weak;
    }

    if (password.length >= 6) {
      if (hasAlphabetCharacters(password) && hasNumberCharacters(password)) {
        return PassStrongIndex.strong;
      }
      return PassStrongIndex.medium;
    }

    return PassStrongIndex.weak;
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
