class Validations {
  static bool emailValidationWidthDomain(String em) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)+$";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  static bool commonValidation(value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    } else if (value.replaceAll(RegExp(r"\s+"), "").length < 6) {
      return false;
    } else {
      return true;
    }
  }
}
