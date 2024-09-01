import 'package:flutter/material.dart';

import '../home_widget/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchTab());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
        )
      ],
    );
  }
}
