import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/generated/l10n.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/ui/views/flashNewsUnitView/flashNewsUnitViewModel.dart';
import 'package:toxnews/ui/views/newspaperUnitView/newspaperUnitViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class NewspaperUnitView extends StatefulWidget {
  String path;

  NewspaperUnitView({required this.path}) : super();

  @override
  _NewspaperUnitViewState createState() => _NewspaperUnitViewState();
}

class _NewspaperUnitViewState extends State<NewspaperUnitView> {


  @override
  Widget build(BuildContext context) {
    PdfController _pdfController = PdfController(document: PdfDocument.openFile(widget.path));
    return ViewModelBuilder<NewspaperUnitViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: PdfView(
              controller: _pdfController,
            ),
          ),
        ),
        viewModelBuilder: () => NewspaperUnitViewModel()
    );
  }
}