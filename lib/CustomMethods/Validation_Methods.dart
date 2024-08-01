class ValidationMethods {
  static bool isEmailValid(String email) {
    // Regular expression to match email format
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

    // Check if the email matches the regular expression
    return emailRegex.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    // Regular expression to match international phone numbers starting with '+'
    RegExp internationalRegex = RegExp(r'^\+[0-9]{1,3}[0-9]{3,14}$');

    // Regular expression to match local phone numbers (optional starting with '0' and following by digits)
    RegExp localRegex = RegExp(r'^[0-9]{5,15}$');

    // Check if the phone number matches either international format (+1234567890) or local format (1234567890)
    if (internationalRegex.hasMatch(phoneNumber) ||
        localRegex.hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }
}
