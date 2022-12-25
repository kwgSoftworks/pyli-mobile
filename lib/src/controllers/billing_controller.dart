import 'package:customerapp/src/models/_models.dart';
import 'package:get/get.dart';

class BillingController extends GetxController{
  Rx<CreditCardModel> selectedCard = CreditCardModel.demo.first.obs;

  RxBool editCardMode = RxBool(false);
  RxString selectedCountry = RxString('');
}