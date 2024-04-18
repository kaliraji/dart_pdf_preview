import 'dart:typed_data';

import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_eval/data.dart';
import 'package:pdf_eval/pdf_eval.dart';
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
          // build: _buildEvcPdf,
        ),
      ),
    );
  }

  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true)
      ..addPage(
        pw.Page(
          build: (pdContext) {
            return pw.Text("Sample");
          },
        ),
      );
    return pdf.save();
  }

  // Future<Uint8List> _buildEvcPdf(PdfPageFormat format) async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   final program = await rootBundle.load('assets/scripts/testorg.evc');
  //   final runtime = Runtime(program);
  //   runtime.addPlugin(pdfEvalPlugin);
  //   runtime.loadGlobalOverrides();
  //   final pdf = runtimeOverride("#testorg_sale_a4", [$SaleData.wrap(saleData)]);
  //   return (pdf as pw.Document).save();
  // }
}
