import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/search_cubit/search__view_model.dart';
import 'package:movie_app/cubits/search_cubit/search_state.dart';
import 'package:movie_app/theme/app_color.dart';

import '../home_widget/search_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController searchController = TextEditingController();

  String searchText = 'd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        title: Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFF514F4F),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Center(
                child: TextField(
                  controller: searchController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        searchText = searchController.text;
                        print(searchText);
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            )),
      ),
      body: BlocProvider(
        create: (context) => SearchViewModel()..getSearch(searchText),
        child: BlocBuilder<SearchViewModel, SearchStates>(
            builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.darkYellowColor,
              ),
            );
          }
          if (state is SearchErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Some Thing Went Wrong!!",
                    style: Theme.of(context).textTheme.headlineMedium),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<SearchViewModel>(context)
                        .getSearch(searchText);
                  },
                  child: Text("Try Again",
                      style: Theme.of(context).textTheme.headlineMedium),
                )
              ],
            );
          }
          if (state is SearchSuccessState) {
            return Expanded(
              child: ListView.separated(
                itemCount:
                    BlocProvider.of<SearchViewModel>(context).searchList.length,
                itemBuilder: (context, index) {
                  final item = BlocProvider.of<SearchViewModel>(context)
                      .searchList[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500/${item.posterPath ?? ""}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/bookmark.png',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColor.yellowColor,
                                ),
                                Text(
                                  "${item.voteAverage!}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                item.title!,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                item.releaseDate!,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: AppColor.yellowColor,
                  );
                },
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}

// actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: IconButton(
        //         onPressed: () {
        //           showSearch(context: context, delegate: SearchTab());
        //         },
        //         icon: const Icon(
        //           Icons.search,
        //           size: 30,
        //         )),
        //   )
        // ],