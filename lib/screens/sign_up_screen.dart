import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Model/dialog_model.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';
import 'package:movie_app/cubits/popular_cubit/popular_view_model.dart';
import 'package:movie_app/home_widget/custom_form_field.dart';
import 'package:movie_app/items/carousal_widget.dart';
import 'package:movie_app/screens/log_in_screen.dart';
import 'package:movie_app/theme/app_color.dart';
import 'package:provider/provider.dart';

import '../cubits/auth/register_navigator.dart';
import '../cubits/auth/register_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    implements RegisterNavigator {
  RegisterViewModel registerViewModel = RegisterViewModel();

  @override
  void initState() {
    super.initState();
    registerViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => registerViewModel,
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
                    return SizedBox(
                      height: 250,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.darkYellowColor,
                        ),
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
                  key: registerViewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFormField(
                        hint: "User Name",
                        controller: registerViewModel.userController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ("Please Enter User Name");
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColor.yellowColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        hint: "Email",
                        controller: registerViewModel.emailController,
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
                          Icons.email,
                          color: AppColor.yellowColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        obscureText: true,
                        hint: "Password",
                        controller: registerViewModel.passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ("Please Enter Password");
                          }
                          if (text.length < 8) {
                            return "Password Must be 8 Digit";
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
                          registerViewModel.register();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColor.yellowColor,
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.darkGrayColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, SignInScreen.routeName);
                              },
                              child: const Text(
                                "Login",
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

  @override
  void goHome() {
    Navigator.pushNamedAndRemoveUntil(
        context, SignInScreen.routeName, (route) => false);
  }
}
