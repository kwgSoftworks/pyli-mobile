import 'package:customerapp/src/helpers/api/_api.dart';

class AuthRepo{

  Future<AResponse> resetPassword(String email) async{
    final data = {
      'email' : email
    };
    final res = await Api.post(ApiEndpoints.forgetPassword, data: data);
    return res;
  }

  Future<AResponse> register({
    required String accType,
    required String email,
    required String fName,
    required String lName,
    required String phone,
    required String password,
    String? siteNumber,
    String? permitNumber,
    int? agency,
    String? brand,
    String? manufacture,
    String? idNumber,
  }) async{
    final data = {
      "business_id": 0,
      "firstname": fName,
      "lastname": lName,
      "email": email,
      "password": password,
      "phone": phone,
      "type": accType,
      "address": "",
      "permitNumber": permitNumber,
      "manufacturer": manufacture,
      "level": "",
      "agency_id": agency ?? 0,
      "isOptedInForMarketing": true,
      "mailStreet": "",
      "mailCity": "",
      "mailState": "",
      "mailZip": ""
    };

    return await Api.post(ApiEndpoints.register, data: data);
  }
}