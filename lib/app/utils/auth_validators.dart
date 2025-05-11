import 'package:get/get.dart';

class AuthValidators {
  AuthValidators._();
  static String? fullName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value!.trim().isEmpty) {
      return 'Phone number is required';
    } else {
      if (!GetUtils.isPhoneNumber(value)) {
        return 'Invalid phone number';
      }
    }

    return null;
  }

  static String? email(String? value) {
    if (value!.trim().isEmpty) {
      return 'Email is required';
    } else if (!GetUtils.isEmail(value.trim())) {
      return 'Email is not valid';
    }
    return null;
  }

  static String? password(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? passwordLogin(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  static String? required(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? username(String? value) {
    if (value!.trim().isEmpty) {
      return 'Username is required';
    }
    // else if (GetUtils.isUsername(value)) {
    //   return 'Username is not valid';
    // }
    return null;
  }
}
