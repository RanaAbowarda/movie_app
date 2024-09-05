import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Model/dialog_model.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';
import 'package:movie_app/cubits/popular_cubit/popular_view_model.dart';
import 'package:movie_app/home_widget/custom_form_field.dart';
import 'package:movie_app/items/carousal_widget.dart';
import 'package:movie_app/screens/sign_up_screen.dart';
import 'package:movie_app/theme/app_color.dart';
import 'package:provider/provider.dart';

import '../cubits/auth/login_navigator.dart';
import '../cubits/auth/login_view_model.dart';
import 'homeScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const routeName = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> implements LoginNavigator {
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    loginViewModel.loginNavigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => loginViewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocProvider(
                create: (context) => PopularViewModel()..getPopular(),
                child: BlocBuilder<PopularViewModel, PopularStates>(
                    builder: (context, state) {
                  var resultList =
                      BlocProvider.of<PopularViewModel>(context).resultList;
                  if (state is PopularLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.darkYellowColor,
                      ),
                    );
                  }
                  if (state is PopularErrorState) {
                    return Column(
                      children: [
                        Text(state.errorMessage),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<PopularViewModel>(context)
                                  .getPopular();
                            },
                            child: Text('try again',
                                style:
                                    Theme.of(context).textTheme.headlineMedium))
                      ],
                    );
                  }
                  if (state is PopularSuccessState) {
                    return CarousalWidget(result: resultList);
                  }
                  return Container();
                }),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: loginViewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFormField(
                        hint: "Email",
                        controller: loginViewModel.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ("Please Enter Your Email");
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "Please Enter Valid Email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColor.yellowColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        obscureText: true,
                        hint: "Password",
                        controller: loginViewModel.passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ("Please Enter Password");
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.password,
                          color: AppColor.yellowColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          loginViewModel.logIn();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColor.yellowColor,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.darkGrayColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: AppColor.yellowColor),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    DialogModel.hideLoading(context);
  }

  @override
  void showLoading(String message) {
    DialogModel.showLoading(context, message);
  }

  @override
  void goHome() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  }

  @override
  void showErrorMessage(String message) {
    DialogModel.showMessage(
      context: context,
      message: message,
      title: "Error",
      posActionName: "Try Again",
      negActionName: "Cancel",
    );
  }

  @override
  void showSuccessMessage(String message) {
    DialogModel.showMessage(
      context: context,
      message: message,
      posActionName: "Ok",
    );
  }
}
