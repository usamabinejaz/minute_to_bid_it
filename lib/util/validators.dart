String? validateEmail(String? email) {
  email ??= "";
  bool validEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  ).hasMatch(email);
  if (generalValidator(email) || !validEmail) {
    return "Please enter a valid Email";
  }
  return null;
}

bool checkContainsDigit(String string) {
  return string.contains(RegExp(r'[0-9]'));
}

bool checkContainsAlphabets(String string) {
  return string.contains(RegExp(r'[a-zA-Z]'));
}

String? validatePassword(String? password) {
  String? error;
  String emptyError = "Please enter a password";
  String lengthError = "Password length must be at least 8";
  String alphaError = "Password must contain at least one letter";
  String digitError = "Password must contain at least one digit";
  if (generalValidator(password)) {
    return '$emptyError'
        '\n$lengthError'
        '\n$alphaError'
        '\n$digitError';
  }
  if (password!.length < 8) {
    error ??= "";
    error += '$lengthError\n';
  }
  if (!checkContainsAlphabets(password)) {
    error ??= "";
    error += '$alphaError\n';
  }
  if (!checkContainsDigit(password)) {
    error ??= "";
    error += '$digitError\n';
  }
  return error;
}

String? validateUsername(String? username) {
  String emptyError = "Please enter Username";
  String lengthError = "Username length must be at least 5";
  if (generalValidator(username)) {
    return '$emptyError'
        '\n$lengthError';
  }
  if (username!.length < 5) {
    return lengthError;
  }
  return null;
}

bool generalValidator(String? string) {
  return string == null || string.isEmpty;
}
