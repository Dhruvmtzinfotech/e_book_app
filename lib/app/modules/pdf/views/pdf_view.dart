import 'package:e_book_app/app/modules/pdf/controllers/pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfView extends StatefulWidget {

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {

  @override
  Widget build(BuildContext context) {
    PdfController pdfCon = Get.put(PdfController());
    return Scaffold(
      appBar: AppBar(title: Text("Pdf"),),
      body:SfPdfViewer.asset("assets/pdf/my_document.pdf"),
    );
  }
}
