import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:html' as html;
import 'package:pdf/widgets.dart' as pw;
import 'package:signature/signature.dart';

class InvoiceController extends GetxController {
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
  );
  final textFields = <Widget>[].obs;

  // final rowTotals = <double>[].obs;
  final text = <Widget>[].obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController titleCodeController = TextEditingController();
  final TextEditingController dateEnteringController = TextEditingController();
  final TextEditingController dueDateEnteringController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController ponController = TextEditingController();
  final TextEditingController ponDataController = TextEditingController();
  final TextEditingController paymentTermsController = TextEditingController();
  final TextEditingController paymentTermsDataController =
      TextEditingController();
  final TextEditingController invoiceFromController = TextEditingController();
  final TextEditingController invoiceToController = TextEditingController();
  final TextEditingController billToController = TextEditingController();
  final TextEditingController mobileToController = TextEditingController();
  final TextEditingController shipToController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController emailToController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController notes1Controller = TextEditingController();
  final TextEditingController notes2Controller = TextEditingController();
  final TextEditingController noteInfoController = TextEditingController();
  final TextEditingController termsConditionsController =
      TextEditingController();
  final TextEditingController bankEmailController = TextEditingController();
  final TextEditingController subtotalController = TextEditingController();
  final TextEditingController subToTalDataController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController discountDataController = TextEditingController();
  final TextEditingController taxController = TextEditingController();
  final TextEditingController taxDataController = TextEditingController();
  final TextEditingController amountPaidController = TextEditingController();
  final TextEditingController amountPaidDataController =
      TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController numbersController = TextEditingController();
  final TextEditingController totalPriceController = TextEditingController();
  late pw.Font emoji;
  Uint8List? signatureImage;
  List<List<TextEditingController>> dynamicTextFieldController = [];
  final totalPrice = [].obs;
   double margin = 10.0;

  // final PdfPageFormat pageFormat = useA4 ? PdfPageFormat.a4 : PdfPageFormat.a3;

  @override
  void onInit() async {
    super.onInit();

    final itemNameController = TextEditingController();
    final numbersController = TextEditingController();
    final rateController = TextEditingController();
    final totalPriceController = TextEditingController();

    dynamicTextFieldController.add([
      itemNameController,
      numbersController,
      rateController,
      totalPriceController
    ]);
    textFields.add(buildRow(
      itemNameController,
      numbersController,
      rateController,
      totalPriceController,
    ));
    emoji = await PdfGoogleFonts.notoColorEmoji();
  }

  void addRow() {
    final itemNameController = TextEditingController();
    final numbersController = TextEditingController();
    final rateController = TextEditingController();
    final totalPriceController = TextEditingController();
    dynamicTextFieldController.add([
      itemNameController,
      numbersController,
      rateController,
      totalPriceController
    ]);
    textFields.add(buildRow(itemNameController, numbersController,
        rateController, totalPriceController));
  }

  void removerow() {
    textFields.removeLast();
  }

  Widget buildRow(
    TextEditingController itemNameController,
    TextEditingController numbersController,
    TextEditingController rateController,
    TextEditingController totalPriceController,
  ) {
    void calculateTotal() {
      final quantity = int.tryParse(numbersController.text) ?? 0;
      final rate = double.tryParse(rateController.text) ?? 0;
      final total = quantity * rate;
      totalPriceController.text = total.toStringAsFixed(2);
      totalPrice.add(double.parse(totalPriceController.text));
    }

    return Row(
      children: [
        SizedBox(
          height: Get.height * 0.043,
          width: Get.width * 0.4,
          child: TextField(
            controller: itemNameController,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            // textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Description of Service or Product",
              hintStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 8),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: const BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
        //SizedBox(width: Get.width * 0.3),
        SizedBox(
          height: Get.height * 0.043,
          width: Get.width * 0.08,
          child: TextField(
            controller: numbersController,
            onChanged: (_) => calculateTotal(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "",
              hintStyle: const TextStyle(
                  color: Colors.black38, fontWeight: FontWeight.w400),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 9.0, horizontal: 8),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: const BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: Get.height * 0.043,
            width: Get.width * 0.1,
            child: TextField(
              controller: rateController,
              onChanged: (_) => calculateTotal(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "",
                hintStyle: const TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.w400),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 9.0, horizontal: 8),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: Get.height * 0.043,
            width: Get.width * 0.1,
            child: TextField(
              controller: totalPriceController,
              readOnly: true,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixText: "₹",
                hintText: "",
                hintStyle: const TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.w400),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 9.0, horizontal: 8),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              removerow();
            },
            icon: const Icon(Icons.remove)),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Rx<Uint8List?> imageBytes = Rx<Uint8List>(Uint8List(0));

  Future<void> imagePicker() async {
    try {
      imageBytes.value = await ImagePickerWeb.getImageAsBytes();
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> generateTextToPdf(Uint8List? signatureImage) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a3,

        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              CustomHeader(),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Row(
                    children: [
                      pw.Container(
                        width: 300,
                        height: 13,
                        color: PdfColors.orangeAccent,
                      ),
                      pw.SizedBox(width: 4),
                      pw.Column(
                        children: [
                          pw.Text(
                            titleController.text.toUpperCase(),
                            style: pw.TextStyle(
                                fontSize: 30,
                                fontStyle: pw.FontStyle.italic,
                                letterSpacing: 2),
                          ),
                          leftTextWithRightBigText(
                              "NO:",
                              titleCodeController.text.toUpperCase(),
                              pw.MainAxisAlignment.end),
                        ]
                      ),

                      pw.SizedBox(width: 4),
                      pw.Container(
                        width: 170,
                        height: 13,
                        color: PdfColors.orange,
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 17),

              pw.SizedBox(height: 12),
              _boldText("Bill To:"),
              pw.SizedBox(height: 10),
              _boldText(invoiceToController.text),
              pw.SizedBox(height: 10),
              _normalText(billToController.text),
              pw.SizedBox(height: 10),
              _normalText(mobileToController.text),
              pw.SizedBox(height: 10),
              _normalText(emailToController.text),
              pw.SizedBox(height: 22),
              leftTextWithRightBigText("Date:", dateEnteringController.text,
                  pw.MainAxisAlignment.end),
              pw.SizedBox(height: 6),
              _buildTable(), //////////
              pw.SizedBox(height: 6),
              //  pw.Row(
              //  mainAxisAlignment: pw.MainAxisAlignment.end,
              //  children: [
              // _buildContainerWithText(discountController.text),
              // _buildContainerWithText("%${discountDataController.text}"),
              // ],
              // ),
              ////////////////////////
              // pw.SizedBox(height: 6),
              // pw.Row(
              //   mainAxisAlignment: pw.MainAxisAlignment.end,
              //   children: [
              //     _buildContainerWithText(subtotalController.text),
              //     _buildContainerWithText(totalPrice
              //         .fold(0.0,
              //             (previousValue, element) => previousValue + element)
              //         .toString()),
              //   ],
              // ),
              pw.SizedBox(height: 10),
              _boldText("Payment Informations"),
              pw.SizedBox(height: 15),
              leftTextWithRightBigTextModify(
                  "Bank:", noteInfoController.text, pw.MainAxisAlignment.start),
              pw.SizedBox(height: 10),
              leftTextWithRightBigTextModify("Acc No:",
                  termsConditionsController.text, pw.MainAxisAlignment.start),
              pw.SizedBox(height: 10),
              leftTextWithRightBigTextModify("Email:", bankEmailController.text,
                  pw.MainAxisAlignment.start),
              pw.Row(
                  // crossAxisAlignment: pw.CrossAxisAlignment.end,
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Column(children: [
                      pw.Container(
                        height: 100,
                        width: 50,
                        child: pw.Image(
                          pw.MemoryImage(signatureImage ?? Uint8List(0)),
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      _boldText(invoiceFromController.text),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Manager Company",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 13,
                            color: PdfColors.black),
                      ),
                    ])
                  ]),
              pw.SizedBox(height: 20),
              iconTextRow(mobileToController.text, emailToController.text,
                  billToController.text)
            ],
          );
        },
      ),
    );

    final Uint8List bytes = await pdf.save();
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute("download", "invoice.pdf")
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  pw.Widget CustomHeader() {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 20), // Adjust top margin as needed
      padding: const pw.EdgeInsets.symmetric(horizontal: 20),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          // Add your logo/image here
          pw.Image(
            pw.MemoryImage(imageBytes.value ?? Uint8List(0)),
            width: 140,
            height: 60,
          ),
          // Add other app bar elements as needed
          // For example, you can add a title or other widgets
        ],
      ),
    );
  }

  pw.Widget drawerHeader(pw.Context context) {
    return pw.Row(
      children: [
        pw.Positioned(
          top: 0,
          left: 0,
          bottom: 30,
          child: pw.Container(
            width: 100,
            height: 30,
            color: PdfColors.yellow,
            child: pw.Text(
              'Your Logo',
              style: const pw.TextStyle(
                fontSize: 12,
                color: PdfColors.black,
              ),
            ),
          ),
        ),
        pw.Container(
          width: 100,
          height: 30,
          color: PdfColors.yellow,
          child: pw.Text(
            'Your Logo',
            style: const pw.TextStyle(
              fontSize: 12,
              color: PdfColors.black,
            ),
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            // Separating border
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                  left: pw.BorderSide(width: 1, color: PdfColors.grey)),
            ),
          ),
        ),
        pw.SizedBox(width: 10), // Spacing between sections
        pw.Text(
          // Invoice title
          'INVOICE',
          style: pw.TextStyle(
              fontSize: 30, fontStyle: pw.FontStyle.italic, letterSpacing: 2),
        ),
      ],
    );
  }

  pw.Widget leftTextWithRightBigText(
    String boldTitle,
    String normalTitle,
    pw.MainAxisAlignment mainAxisAlignment,
  ) {
    return pw.Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        pw.Text(
          boldTitle,
          style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 16,
              color: PdfColors.black),
        ),
        pw.SizedBox(width: 5),
        pw.Text(
          normalTitle,
          style: pw.TextStyle(
              fontStyle: pw.FontStyle.italic,
              fontSize: 14,
              color: PdfColors.grey700),
        ),
      ],
    );
  }

  pw.Widget leftTextWithRightBigTextModify(
    String boldTitle,
    String normalTitle,
    pw.MainAxisAlignment mainAxisAlignment,
  ) {
    return pw.Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        pw.Text(
          boldTitle,
          style: pw.TextStyle(
              fontWeight: pw.FontWeight.normal,
              fontSize: 13,
              color: PdfColors.black),
        ),
        pw.SizedBox(width: 5),
        pw.Text(
          normalTitle,
          style: pw.TextStyle(
              fontStyle: pw.FontStyle.normal,
              fontSize: 12,
              color: PdfColors.grey700),
        ),
      ],
    );
  }

  pw.Widget _boldText(String title) {
    return pw.Text(
      title,
      style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold, fontSize: 16, color: PdfColors.black),
    );
  }

  pw.Widget _normalText(String title) {
    return pw.Text(
      title,
      style: pw.TextStyle(
          fontWeight: pw.FontWeight.normal,
          fontSize: 14,
          color: PdfColors.grey700),
    );
  }

  pw.Widget _buildTable() {
    final List<List<String>> tableData = dynamicTextFieldController
        .map((List<TextEditingController> e) =>
            e.map((TextEditingController e) => e.text).toList())
        .toList();

    // Calculate the total price
    double totalPrice = 0.0;
    for (var row in tableData) {
      double price = double.tryParse(row[2]) ?? 0.0;
      int quantity = int.tryParse(row[1]) ?? 0;
      totalPrice += price * quantity;
    }
    double subtotal = tableData.fold(0.0, (previousValue, row) {
      double price = double.tryParse(row[2]) ?? 0.0;
      int quantity = int.tryParse(row[1]) ?? 0;
      return previousValue + (price * quantity);
    });

    // Adding Discount and Subtotal rows
    tableData
        .add(['', '', discountController.text, discountDataController.text]);
    tableData.add(['', '', subtotalController.text, subtotal.toString()]);

    return pw.Container(
      child: pw.Table(
        border: pw.TableBorder.all(),
        children: <pw.TableRow>[
          // Header row
          pw.TableRow(
            children: <pw.Widget>[
              for (var header in ['Description', 'Qty', 'Price', 'Total'])
                pw.Container(
                  decoration:
                      const pw.BoxDecoration(color: PdfColors.orangeAccent),
                  padding: const pw.EdgeInsets.all(10),
                  child: pw.Text(
                    header,
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
            ],
          ),
          // Data rows
          for (var i = 0; i < tableData.length; i++)
            pw.TableRow(
              decoration: i == tableData.length - 1
                  ? const pw.BoxDecoration(color: PdfColors.orangeAccent)
                  : null,
              children: <pw.Widget>[
                for (var j = 0; j < tableData[i].length; j++)
                  pw.Container(
                    padding: const pw.EdgeInsets.all(10),
                    decoration: (j != 2 && i == tableData.length - 1)
                        ? const pw.BoxDecoration(color: PdfColors.orangeAccent)
                        : null,
                    child: pw.Text(
                      tableData[i][j],
                      style: pw.TextStyle(
                        color: (tableData[i][j] == discountController.text ||
                                tableData[i][j] == subtotalController.text)
                            ? PdfColors.black
                            : PdfColors.black,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  // pw.Widget _buildTable() {
  //   pw.TextStyle totalRowTextStyle = pw.TextStyle(color: PdfColors.red);
  //   final List<List<String>> tableData = dynamicTextFieldController
  //       .map((List<TextEditingController> e) =>
  //       e.map((TextEditingController e) => e.text).toList())
  //       .toList();
  //
  //   // Calculate the total price
  //   double totalPrice = 0.0;
  //   for (var row in tableData) {
  //     double price = double.tryParse(row[2]) ?? 0.0;
  //     int quantity = int.tryParse(row[1]) ?? 0;
  //     totalPrice += price * quantity;
  //   }
  //   double subtotal = tableData.fold(0.0, (previousValue, row) {
  //     double price = double.tryParse(row[2]) ?? 0.0;
  //     int quantity = int.tryParse(row[1]) ?? 0;
  //     return previousValue + (price * quantity);
  //   });
  //
  //   // Adding Discount and Subtotal rows
  //   tableData.add(['', '', discountController.text, discountDataController.text]);
  //   tableData.add(['', '', subtotalController.text, subtotal.toString()]);
  //
  //   return pw.Container(
  //     child: pw.Table(
  //       border: pw.TableBorder.all(),
  //       children: <pw.TableRow>[
  //         pw.TableRow(
  //           children: <pw.Widget>[
  //             for (var header in ['Description', 'Qty', 'Price', 'Total'])
  //               pw.Container(
  //                 decoration: pw.BoxDecoration(color: PdfColors.orangeAccent),
  //                 padding: const pw.EdgeInsets.all(10),
  //                 child: pw.Text(
  //                   header,
  //                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
  //                 ),
  //               ),
  //           ],
  //         ),
  //         for (var row in tableData)
  //           pw.TableRow(
  //             children: <pw.Widget>[
  //               for (var cell in row)
  //                 pw.Container(
  //                   padding: const pw.EdgeInsets.all(10),
  //                   child: pw.Text(
  //                     cell,
  //                     style: pw.TextStyle(color: (cell == discountController.text || cell == subtotalController.text) ? PdfColors.blue : PdfColors.black),
  //                   ),
  //                 ),
  //             ],
  //           ),
  //       ],
  //     ),
  //   );
  // }

  // pw.Widget _buildTable() {
  //   return pw.TableHelper.fromTextArray(
  //     cellAlignment: pw.Alignment.center,
  //     headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
  //     data: dynamicTextFieldController
  //         .map((List<TextEditingController> e) =>
  //             e.map((TextEditingController e) => e.text).toList())
  //         .toList(),
  //     headers: ['Description', 'Qty', 'Price', 'Total'],
  //     cellStyle: const pw.TextStyle(color: PdfColors.black),
  //     headerDecoration: const pw.BoxDecoration(color: PdfColors.orange500),
  //     oddRowDecoration: const pw.BoxDecoration(color: PdfColors.grey200),
  //   );
  // }

  pw.Widget iconTextRow(
      String phoneNumber, String emailAddress, String locationAddress) {
    return pw.Row(
      children: [
        pw.Text("📞",
            style:
                pw.TextStyle(fontFallback: [emoji], color: PdfColors.orange50)),
        pw.SizedBox(width: 5),
        pw.Text(
          phoneNumber,
          style: pw.TextStyle(
              fontStyle: pw.FontStyle.normal,
              fontSize: 12,
              color: PdfColors.grey700),
        ),
        pw.SizedBox(width: 20),
        pw.Text("📩",
            style:
                pw.TextStyle(fontFallback: [emoji], color: PdfColors.orange50)),
        pw.SizedBox(width: 5),
        pw.Text(
          emailAddress,
          style: pw.TextStyle(
              fontStyle: pw.FontStyle.normal,
              fontSize: 12,
              color: PdfColors.grey700),
        ),
        pw.SizedBox(width: 20),
        pw.Text("📌",
            style:
                pw.TextStyle(fontFallback: [emoji], color: PdfColors.orange50)),
        pw.SizedBox(width: 5),
        pw.Text(
          locationAddress,
          style: pw.TextStyle(
              fontStyle: pw.FontStyle.normal,
              fontSize: 12,
              color: PdfColors.grey700),
        ),
      ],
    );
  }
}
