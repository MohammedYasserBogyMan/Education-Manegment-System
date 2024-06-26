class Validator {
  static String? validateEmail(String mail) {
    if (mail.isEmpty) {
      return "Required";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(mail)) {
      return "please_enter_valid_mail";
    }
    return null;
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return "Required";
    }
    // ٠، ١، ٢، ٣، ٤، ، ٦، ٧، ٨، ٩
    if (name.length < 2) {
      return "should_be_at_least_2_alphabetic_characters";
    }
    if (name.contains(RegExp(r'[0-9]')) ||
        name.contains("٠") ||
        name.contains("١") ||
        name.contains("٢") ||
        name.contains("٣") ||
        name.contains("٤") ||
        name.contains("٥") ||
        name.contains("٦") ||
        name.contains("٧") ||
        name.contains("٨") ||
        name.contains("٩")) {
      return "should_be_alphabetic_characters";
    }
    if (name.length > 44) {
      return "the_number_of_characters_must_be_less_than_44";
    }
    Pattern pattern4 = r'[!@#$%^&*(),.?":{}|<>]';
    RegExp regex4 = RegExp(pattern4.toString());
    if (regex4.hasMatch(name)) {
      return "please_don't_enter_special_characters";
    }
    return null;
  }

  static String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return "Required";
    }

    if (!phone.startsWith("5")) {
      return "make_sure_start_with_5";
    }
    if (phone.length != 9) {
      return "phone_number_must_be_9_numbers";
    }
    return null;
  }

  static String? validateOTP(String otp) {
    if (otp.isEmpty) {
      return "Required";
    }
    if (otp.length < 6) {
      return "otp_number_must_be_6_numbers";
    }
    return null;
  }

  static String? validateBornDate(String bornDate) {
    if (bornDate.isEmpty) {
      return "Required";
    }
    return null;
  }

  static String? validateCity(String city) {
    if (city.isEmpty) {
      return "Required";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Required";
    }
    if (password.length < 5) {
      return "please_enter_at_least_8_characters_in_password";
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String newPassword) {
    if (password.isEmpty) {
      return "Required";
    }
    if (password.length < 8) {
      return "please_enter_at_least_8_characters_in_password";
    }
    if (password != newPassword) {
      return "password_does_not_match";
    }
    return null;
  }

  static String? validateAddress(String value) {
    if (value.trim().isEmpty) {
      return "Required";
    }
    if (value.trim().length < 2) {
      return "should_be_at_least_2_alphabetic_characters";
    }
    return null;
  }

  static String? validateCRNumber(String value) {
    if (value.trim().isEmpty) {
      return "Required";
    }
    return null;
  }

  static String? validateBio(String value) {
    if (value.trim().isEmpty) {
      return "Required";
    }
    return null;
  }
}

class AppRegExp {
  AppRegExp._();

  static final numericRegex = RegExp(r'[0-9]');

  // static final symRegex = RegExp(r'[!@#$%^&*()]');
  static final hasUpperCase = RegExp(r'[A-Z]');
  static final hasLowerCase = RegExp(r'[a-z]');
}
