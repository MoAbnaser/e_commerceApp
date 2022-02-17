import 'package:e_commerce_app/model/facebook_model.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckedBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  FaceBookModel? faceBookModel;
  var googleSignIn = GoogleSignIn();
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checked() {
    isCheckedBox = !isCheckedBox;
    update();
  }

  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(AppRoutes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ');
      String message = '';
      if (error.code == 'weak-password') {
        message = ' Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.black,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.black,
      );
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(AppRoutes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ');
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.black,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.black,
      );
    }
  }

  void restPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ');
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.black,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.black,
      );
    }
  }

  void googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      // await auth.signInWithCredential(credentiaxl);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();

      Get.offNamed(AppRoutes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void faceBookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(AppRoutes.mainScreen);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove("auth");
      update();

      Get.offNamed(AppRoutes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
