import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/firebase_function.dart';
import 'package:movie_app/theme/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../items/item_of_watch_list.dart';
import '../screens/log_in_screen.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  String? userName;

  @override
  void initState() {
    loadUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hieghtOfScreen = MediaQuery.of(context).size.height;
    final widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: AppColor.primaryColor,
        title: userName != null
            ? Text('Welcome 😊 $userName!',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColor.yellowColor))
            : Text('Welcome',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColor.yellowColor)),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, SignInScreen.routeName, (route) => false);
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: AppColor.yellowColor,
              ))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFunction.getMovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: const CircularProgressIndicator(
                color: AppColor.yellowColor,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "Some Thing Wrong",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseFunction.getMovie();
                      },
                      child: Text(
                        "Try Again",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ))
                ],
              ),
            );
          }
          var movies = snapshot.data!.docs.map((doc) => doc.data()).toList();
          if (movies.isEmpty) {
            return Center(
                child: Text(
              "NO Movies",
              style: Theme.of(context).textTheme.headlineMedium,
            ));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: widthOfScreen * 0.068),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Watchlist',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 35,
                        color: AppColor.grayColor,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ItemOfWatchList(
                        movie: movies[index],
                        widthOfScreen: widthOfScreen,
                        heightOfScreen: hieghtOfScreen,
                      );
                    },
                    itemCount: movies.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName'); // Retrieve the username
    });
  }
}
