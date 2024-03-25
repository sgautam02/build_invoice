import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/Invoice_page.dart';
import 'controller/invoice_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceController());
    return
    //PdfGenerator();
      const InvoicePage();

  }
}




