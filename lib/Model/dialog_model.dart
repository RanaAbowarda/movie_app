import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_color.dart';

class DialogModel {
  static void showLoading(
    BuildContext context,
    String message,
  ) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColor.primaryColor,
            contentPadding: const EdgeInsets.all(15),
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: AppColor.yellowColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColor.yellowColor),
                  ),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String title = "",
      String? posActionName,
      String? negActionName,
      Function? posAction,
      Function? negAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      // Add the action you need..
      actions.add(
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColor.yellowColor),
          ),
        ),
      );
    }
    if (negActionName != null) {
      // Add the action you need..
      actions.add(
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColor.yellowColor),
          ),
        ),
      );
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColor.primaryColor,
            contentPadding: const EdgeInsets.all(15),
            content: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColor.yellowColor),
            ),
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColor.yellowColor),
            ),
            actions: actions,
          );
        });
  }
}
