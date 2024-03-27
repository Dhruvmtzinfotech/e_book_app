import 'package:e_book_app/app/modules/subject/controllers/subject_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/responsive.dart';
import '../../pdf/views/pdf_view.dart';

class SubjectView extends GetView<SubjectController> {

  const SubjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SubjectController subjectCon = Get.put(SubjectController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Subject'),
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
                  // var data = {
                  //   "pdfUrl": "assets/pdf/my_document.pdf"
                  // };
                  Get.to(() => PdfView());
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("assets/img/sunset.jpg")),
                    Positioned(
                      child: Text('Chapter 1',
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
