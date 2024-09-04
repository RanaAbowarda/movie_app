import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../home_widget/new_releases_widget.dart';
import '../home_widget/popular_widget.dart';
import '../home_widget/recommended_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PopularItem(),
        NewReleasesWidget(),
        const SizedBox(
          height: 20,
        ),
        RecommendedWidget()
      ]),
    );
  }
}
