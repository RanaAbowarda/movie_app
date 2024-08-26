import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_color.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});
  static const routeName = "MovieDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Image.png'),
                fit: BoxFit.cover),
          ),
          child: Center(
              child: ImageIcon(
            AssetImage('assets/images/play-button-2.png'),
            color: Colors.white,
            size: 60,
          )),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text(
                'Dora and the lost city of gold',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Spacer(),
              Text(
                '2019  PG-13  2h 7m',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Spacer(),
              Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/images/Image.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.22,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      Positioned(
                        child: ImageIcon(
                          AssetImage('assets/images/bookmark.png'),
                          color: Color(0xFF514F4F),
                          size: 40,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 12,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 17,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColor.grayColor,
                                  )),
                              child: Center(
                                child: Text(
                                  'Action',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColor.grayColor,
                                  )),
                              child: Center(
                                child: Text(
                                  'Action',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColor.grayColor,
                                  )),
                              child: Center(
                                child: Text(
                                  'Action',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.58,
                          child: Text(
                            'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/star-2.png'),
                              size: 20,
                              color: AppColor.yellowColor,
                            ),
                            Text(
                              '7.7',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Spacer()
            ],
          ),
        )
      ],
    );
  }
}
