import 'package:flutter/material.dart';
import 'package:movie_app/Model/genre_model.dart';
import 'package:movie_app/home_tabs/browse_screen.dart';
import 'package:movie_app/home_tabs/home_tab.dart';
import 'package:movie_app/home_tabs/search_screen.dart';
import 'package:movie_app/home_tabs/watch_list_screen.dart';
import 'package:movie_app/home_widget/browse_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/Home icon.png"),
                ),
                label: "HOME"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/search.png"),
                ),
                label: "SEARCH"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/movie.png"),
                ),
                label: "BROWSE"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/bookmarks.png"),
                ),
                label: "WATCHLIST"),
          ]),
      body: tabs[selectedIndex],
    );
  }

  GenreModel? genreModel;

  void onItemClick(genreModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BrowseWidget(id: genreModel.id),
      ),
    );
    setState(() {});
  }

  List<Widget> get tabs => [
        const HomeTab(),
        SearchScreen(),
        genreModel == null
            ? BrowseScreen(onItemClick: onItemClick)
            : BrowseWidget(id: genreModel!.id!),
        const WatchListScreen(),
      ];
}
