import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:movie_app/home_items/new_releases_widget.dart';
import 'package:movie_app/home_items/recommended_widget.dart';

import '../home_items/popular_item.dart';



class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Expanded(child: PopularItem()),
      Expanded(child: NewReleasesWidget()),
      Expanded(child: RecommendedWidget())
    ]);

  }
}
