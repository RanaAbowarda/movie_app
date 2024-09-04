// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/cubits/search_cubit/search__view_model.dart';
// import 'package:movie_app/cubits/search_cubit/search_state.dart';

// import '../theme/app_color.dart';

// class SearchTab extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: IconButton(
//             onPressed: () {
//               showResults(context);
//             },
//             icon: const Icon(
//               Icons.search,
//               size: 25,
//               color: AppColor.yellowColor,
//             )),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: IconButton(
//             onPressed: () {
//               query = "";
//               showSuggestions(context);
//             },
//             icon: const Icon(
//               Icons.clear,
//               size: 25,
//               color: AppColor.yellowColor,
//             )),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: const Icon(
//           Icons.arrow_back,
//           size: 25,
//           color: AppColor.yellowColor,
//         ));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return buildSearchData();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return buildSearchData();
//   }

//   Widget buildSearchData() {
//     return BlocProvider(
//       create: (context) => SearchViewModel()..getSearch(query),
//       child:
//           BlocBuilder<SearchViewModel, SearchStates>(builder: (context, state) {
//         if (state is SearchLoadingState) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: AppColor.darkYellowColor,
//             ),
//           );
//         }
//         if (state is SearchErrorState) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text("Some Thing Went Wrong!!",
//                   style: Theme.of(context).textTheme.headlineMedium),
//               ElevatedButton(
//                 onPressed: () {
//                   BlocProvider.of<SearchViewModel>(context).getSearch(query);
//                 },
//                 child: Text("Try Again",
//                     style: Theme.of(context).textTheme.headlineMedium),
//               )
//             ],
//           );
//         }
//         if (state is SearchSuccessState) {
//           return ListView.separated(
//             itemCount:
//                 BlocProvider.of<SearchViewModel>(context).searchList.length,
//             itemBuilder: (context, index) {
//               final item =
//                   BlocProvider.of<SearchViewModel>(context).searchList[index];
//               return Padding(
//                 padding: const EdgeInsets.only(
//                   top: 20,
//                   left: 20,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 150,
//                       width: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         image: DecorationImage(
//                           image: NetworkImage(
//                               "https://image.tmdb.org/t/p/w500/${item.posterPath ?? ""}"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             'assets/images/bookmark.png',
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               Icons.star,
//                               color: AppColor.yellowColor,
//                             ),
//                             Text(
//                               "${item.voteAverage!}",
//                               style: Theme.of(context).textTheme.titleMedium,
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             item.title!,
//                             style: Theme.of(context).textTheme.titleLarge,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             item.releaseDate!,
//                             style: Theme.of(context).textTheme.titleLarge,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return const Divider(
//                 color: AppColor.yellowColor,
//               );
//             },
//           );
//         }
//         return Container();
//       }),
//     );
//   }

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     assert(context != null);
//     final ThemeData theme = Theme.of(context).copyWith(
//         inputDecorationTheme: InputDecorationTheme(
//             fillColor: Colors.red,
//             hintStyle: TextStyle(color: AppColor.yellowColor)
//             // border:
//             ),
//         appBarTheme: AppBarTheme(
//             color: Colors.transparent,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50),
//             )));
//     assert(theme != null);
//     return theme;
//   }
// }
