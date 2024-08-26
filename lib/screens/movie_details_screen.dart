import 'package:flutter/material.dart';
import 'package:movie_app/home_items/custom_item.dart';
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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Image.png'),
                fit: BoxFit.cover),
          ),
          child: const Center(
              child: ImageIcon(
            AssetImage('assets/images/play-button-2.png'),
            color: Colors.white,
            size: 60,
          )),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.4,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Spacer(),
            Text(
              'Dora and the lost city of gold',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Text(
              '2019  PG-13  2h 7m',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Row(
              children: [
                CustomScreen(),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
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
                          const SizedBox(
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
                          const SizedBox(
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
                      const Spacer(
                        flex: 1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.58,
                        child: Text(
                          'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Row(
                        children: [
                          const ImageIcon(
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
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ]),
              ],
            ),

        ),
      ],
    );
  }
}
