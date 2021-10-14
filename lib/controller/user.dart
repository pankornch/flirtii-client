import 'package:flirtii/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = User().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    print("ok");
    super.onInit();
  }
}
