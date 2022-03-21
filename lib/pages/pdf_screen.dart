// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfScreen extends StatefulWidget {
  @override
  _PdfState createState() => _PdfState();
}
class _PdfState extends State<PdfScreen> {
  static const int _initialPage = 2;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  bool _isLoading = true;
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    // document = await PDFDocument.fromAsset('assets/pdf/nb.pdf');
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/nb.pdf'),
      initialPage: _initialPage,
    );
    setState(() => _isLoading = false);
  }
  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Instruction'),
      ),
      body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              :
    PdfViewPinch(
    documentLoader: const Center(child: CircularProgressIndicator()),
    pageLoader: const Center(child: CircularProgressIndicator()),
    controller: _pdfController,
    onDocumentLoaded: (document) {
    setState(() {
    _allPagesCount = document.pagesCount;
    });
    },
    onPageChanged: (page) {
    setState(() {
    _actualPageNumber = page;
    });
    },
    ),
    ));
  }
}