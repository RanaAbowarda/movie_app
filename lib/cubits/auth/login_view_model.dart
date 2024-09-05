import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/firebase_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user_model.dart';
import 'login_navigator.dart';

class LoginViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late LoginNavigator loginNavigator;

  void logIn() async {
    if (formKey.currentState?.validate() == true) {
      loginNavigator.showLoading("loading....");
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        UserModel? user = await FirebaseFunction.getUser();
        await saveUserData(user);
        loginNavigator.hideLoading();
        loginNavigator.showSuccessMessage("Welcome Back");

        loginNavigator.goHome();
      } on FirebaseAuthException catch (e) {
        loginNavigator.hideLoading();
        loginNavigator.showErrorMessage(
          e.toString(),
        );
      } catch (e) {
        loginNavigator.hideLoading();
        loginNavigator.showErrorMessage(
          e.toString(),
        );
      }
    }
  }

  Future<void> saveUserData(UserModel? user) async {
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', user.id);
      await prefs.setString('userName', user.userName);
    }
  }
}
