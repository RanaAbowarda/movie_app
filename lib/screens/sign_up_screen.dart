import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';
import 'package:movie_app/cubits/popular_cubit/popular_view_model.dart';
import 'package:movie_app/screens/sign_in_screen.dart';
import 'package:movie_app/theme/app_color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            style: Theme.of(context).textTheme.headlineMedium))
                  ],
                );
              }
              if (state is PopularSuccessState) {
                return CarouselSlider.builder(
                  itemCount: resultList.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 230,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${resultList[itemIndex].backdropPath}"),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            resultList[itemIndex].title!.length < 15
                                ? resultList[itemIndex].title!
                                : resultList[itemIndex].title!.substring(0, 15),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            resultList[itemIndex].releaseDate!,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  options: CarouselOptions(
                    height: 350,
                    aspectRatio: 16 / 5,
                    viewportFraction: 0.5,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.linear,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
              return Container();
            }),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                        color: AppColor.yellowColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: AppColor.yellowColor.withOpacity(0.12),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColor.yellowColor,
                      )),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: AppColor.yellowColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: AppColor.yellowColor.withOpacity(0.12),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColor.yellowColor,
                      )),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: AppColor.yellowColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: AppColor.yellowColor.withOpacity(0.12),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.password,
                      color: AppColor.yellowColor,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
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
        ],
      ),
    );
  }
}
