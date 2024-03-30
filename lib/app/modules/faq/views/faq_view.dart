import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:get/get.dart';
import '../../../../utils/strings.dart';
import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildExpandableText('How can I download eBooks?'),
            _buildExpandableText('Are there free ebooks available?'),
            _buildExpandableText('Can I read eBooks offline?'),
            _buildExpandableText('How can I purchase eBooks?'),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableText(String question) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ExpansionTile(
          title: Text(
            question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandableText(
                faqViewBody,
                textAlign: TextAlign.center,
              ),
            ),
            // RatingBar.builder(
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   itemBuilder: (context, _) => Icon(
            //     Icons.star,
            //     color: Colors.amber,
            //   ),
            //   onRatingUpdate: (rating) {
            //     // print(rating);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
