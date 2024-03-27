import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

class RateController extends GetxController {

  final InAppReview _inAppReview = InAppReview.instance;

  void openAppStoreReview(BuildContext context) async {
    if (await _inAppReview.isAvailable()) {
      _inAppReview.openStoreListing();
    } else {
      _showRatingDialog(context);
    }
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Rate this App'),
          content: Text('Please leave a rating for our app!'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                // Handle submitting rating
                Get.back();
              },
              child: Text('SUBMIT'),
            ),
          ],
        );
      },
    );
  }
}

