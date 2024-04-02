import 'package:e_book_app/app/modules/subject/views/subject_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/responsive.dart';
import '../controllers/books_controller.dart';

class BooksView extends GetView<BooksController> {

  const BooksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: width_3,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Get.to(() => const SubjectView());
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/img/subjectImg.jpg")),
                  const Positioned(
                    child: Text('Subject 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
