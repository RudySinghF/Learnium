import 'package:get/get.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/pages/home.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified = await authentication.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => const homepage()) : Get.back();
  }
}
