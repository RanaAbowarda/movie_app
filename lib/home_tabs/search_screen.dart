import 'package:flutter/material.dart';
import 'package:movie_app/home_widget/search_widget.dart';
import 'package:movie_app/theme/app_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // padding: EdgeInsets.only(right: 300),
                height: 48,
                width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.darkGrayColor),
                child: GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: SearchTab());
                  },
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Icon(
                          Icons.search,
                          size: 30,
                          color: AppColor.grayColor,
                        ),
                      ),
                      Text(
                        "Search",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Image.asset("assets/images/movie_icon.png"),
              Text(
                "No Movies",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer()
            ],
          ),
        ));
  }
}
