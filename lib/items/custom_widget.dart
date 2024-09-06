import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/movie_model.dart';

import '../Model/PopularMovies.dart';
import '../Model/firebase_function.dart';
import '../theme/app_color.dart';

class CustomScreen extends StatefulWidget {
  CustomScreen(
      {super.key,
      required this.image,
      this.heightMeasure,
      this.widthMeasure,
      this.results,
      this.coverImage,
      this.isAdd = false});

  String? coverImage;
  Results? results;
  double? widthMeasure;
  double? heightMeasure;
  String image;
  bool isAdd;

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  void initState() {
    isMovieAdd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: widget.widthMeasure ?? width * 0.25,
      // width * 0.25,
      height: widget.heightMeasure ?? height * 0.15,
      //  height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
              image: CachedNetworkImageProvider(widget.image),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageIcon(
                color: widget.isAdd ? AppColor.yellowColor : AppColor.grayColor,
                const AssetImage(
                  'assets/images/bookmark.png',
                ),
              ),
              Positioned(
                  top: 3,
                  left: 5,
                  child: GestureDetector(
                      onTap: () {
                        if (widget.isAdd == false) {
                          var movie = Movie(
                              userId:
                                  FirebaseAuth.instance.currentUser?.uid ?? "",
                              title: widget.results!.title!,
                              originalTitle: widget.results!.originalTitle!,
                              image: widget.coverImage!,
                              releasedDate: widget.results!.releaseDate!);
                          FirebaseFunction.addMovie(movie);
                          setState(() {
                            widget.isAdd = !widget.isAdd;
                          });
                        }
                      },
                      child: Icon(
                        widget.isAdd ? Icons.done_outlined : Icons.add,
                        color: widget.isAdd
                            ? AppColor.yellowColor
                            : AppColor.whiteColor,
                        size: 12,
                      )))
            ],
          ),
        ],
      ),
    );
  }

  Future<void> isMovieAdd() async {
    bool added = await FirebaseFunction.isMovieAdd(widget.results!.title!);
    setState(() {
      widget.isAdd = added;
    });
  }
}
