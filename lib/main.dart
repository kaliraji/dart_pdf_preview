import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:printing/printing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Dart Pdf Preview"),
        ),
        body: PdfPreview(
          build: _buildPdf,
        ),
      ),
    );
  }

  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final pdf = pd.Document(version: PdfVersion.pdf_1_5, compress: true)
      ..addPage(
        pd.Page(
          build: (pdContext) {
            return pd.Text("Sample Pdf");
          },
        ),
      );
    return pdf.save();
  }
}
