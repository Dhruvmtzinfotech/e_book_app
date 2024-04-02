import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import '../app/modules/login/controllers/login_controller.dart';
import '../app/modules/otp/views/otp_view.dart';

LoginController loginCon = Get.put(LoginController());
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential> signInWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;
      final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
        code: 'Facebook Login Failed',
        message: 'The Facebook login was not successful.',
      );
    }
  } on FirebaseAuthException catch (e) {
    print('Firebase Auth Exception: ${e.message}');
    rethrow;
  } catch (e) {
    print('Other Exception: $e');
    rethrow;
  }
}

Future? signInWithPhone() async
{
  await FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException ex) {},
      codeSent: (String verificationId, int? resendToken) {

        Get.to(() => const OtpView(), arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      phoneNumber:"+91${loginCon.phoneController.text.toString()}");
}