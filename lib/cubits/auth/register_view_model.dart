import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/cubits/auth/register_navigator.dart';

import '../../Model/firebase_function.dart';
import '../../Model/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late RegisterNavigator navigator;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      navigator.showLoading("loading....");
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        var userModel = UserModel(
            email: emailController.text,
            userName: userController.text,
            id: credential.user?.uid ?? '');
        await FirebaseFunction.addUser(userModel);

        navigator.hideLoading();
        navigator.showSuccessMessage("Register Successfully.");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          navigator.hideLoading();
          navigator.showErrorMessage("The Password Provided Is Too Weak.");
        } else if (e.code == 'email-already-in-use') {
          navigator.hideLoading();
          navigator
              .showErrorMessage("The account already exists for that email.");
        }
      } catch (e) {
        navigator.hideLoading();
        navigator.showErrorMessage(e.toString());
      }
    }
  }
}
