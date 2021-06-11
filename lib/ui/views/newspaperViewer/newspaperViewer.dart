import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/ui/views/newspaperViewer/newspaperViewerViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class NewspaperViewer extends StatefulWidget {
  String path;

  NewspaperViewer({required this.path}) : super();

  @override
  _NewspaperViewerState createState() => _NewspaperViewerState();
}

class _NewspaperViewerState extends State<NewspaperViewer> {


  @override
  Widget build(BuildContext context) {
    PdfController _pdfController = PdfController(document: PdfDocument.openFile(widget.path));
    return ViewModelBuilder<NewspaperViewerViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: PdfView(
              controller: _pdfController,
            ),
          ),
        ),
        viewModelBuilder: () => NewspaperViewerViewModel()
    );
  }
}