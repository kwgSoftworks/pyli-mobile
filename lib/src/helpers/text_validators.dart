import 'package:get/get_utils/get_utils.dart';

class TextValidators{

  static String? email(String? string) {
    const String msg = 'Please enter a valid email address';
    if(string == null) return msg;
    final str = string.trim();
    return str.isEmail ? null : msg;
  }

  static String? name(String? string) {
    const String msg = 'Please enter a valid user name';
    if(string == null) return msg;
    final str = string.trim();
    return str.length > 1 ? null : msg;
  }

  static String? password(String? string) {
    const String msg = 'Password must be at least 6 characters';
    if(string == null) return msg;
    final str = string.trim();
    return str.length >= 6 ? null : msg;
  }

  static String? phone(String? string) {
    const String msg = 'Phone number must be at least 9 characters';
    if(string == null) return msg;
    final str = string.trim();
    return str.length >= 6 ? null : msg;
  }
}