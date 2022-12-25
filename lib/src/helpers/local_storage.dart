import 'package:get_storage/get_storage.dart';

class LocalStorage{
  final GetStorage _storage = GetStorage();
  static Future<void> init() async{
    await GetStorage.init();
  }

  Future<void> saveUserEmailPassword(String email, String password) async{
    _storage.write(_StorageKeys.usercreds, {
      'email' : email,
      'password' : password
    });
  }

  Map? getUserEmailPassword(){
    if(_storage.hasData(_StorageKeys.usercreds)){
      final value = _storage.read(_StorageKeys.usercreds);
      if(value != null && value != ''){
        return value;
      }else{
        return null;
      }
    }else{
      return null;
    }
  }
}

class _StorageKeys{
  _StorageKeys._();

  static const usercreds = 'user_auth_creds';
}