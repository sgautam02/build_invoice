

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../controller/invoice_controller.dart';
import '../widgets/Textfield.dart';

class InvoicePage extends GetView<InvoiceController> {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: Container(
                height: MediaQuery.of(context).size.height * 10,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: Get.size.height * 0.2,
                              width: Get.size.width * 0.2,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Obx(() {
                                return Center(
                                  child:
                                      (controller.imageBytes.value?.isEmpty ??
                                              false)
                                          ? GestureDetector(
                                              onTap: () {
                                                controller.imagePicker();
                                              },
                                              child: const Text(
                                                '+ Add Your Logo',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child:

                                                  Image(
                                                image: MemoryImage(
                                                  controller.imageBytes.value ??
                                                      Uint8List(0),
                                                ),
                                              ),
                                            ),
                                );
                              })),
                          SizedBox(
                            width: Get.size.width * 0.25,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                mediumTextField(
                                    text: "Enter Title",
                                    controller: controller.titleController),
                                SizedBox(
                                  height: Get.size.height * 0.035,
                                ),
                                SizedBox(
                                  width: Get.size.width * 0.1,
                                  child: TextField(
                                    controller: controller.titleCodeController,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixText: "#",
                                      hintText: "Bill No",
                                      prefixStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide:
                                            const BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide:
                                            const BorderSide(color: Colors.green),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.size.height * 0.07,
                      ),
                      SizedBox(
                        width: Get.size.width * 0.27,
                        child: TextField(
                          controller: controller.invoiceFromController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText:
                                "Who is this invoice from? (required)",
                            hintStyle: const TextStyle(
                              height: 1,
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1),
                              borderSide:
                                  const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1),
                              borderSide:
                                  const BorderSide(color: Colors.green),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1),
                              borderSide:
                                  const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.size.width * 0.07,
                      ),
                      Column(

                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              smallSmallTextField(
                                  hintText: "Date",
                                  controller: controller.dateController),
                              SizedBox(
                                width: Get.size.width * 0.03,
                              ),
                              mediumTextField(
                                  text: "22 Sep 2025",
                                  controller:
                                      controller.dateEnteringController)
                            ],
                          ),
                          SizedBox(
                            height: Get.size.height * 0.009,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              smallSmallTextField(
                                  hintText: "Due Date",
                                  controller: controller.dueDateController),
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.03,
                              ),
                              mediumTextField(
                                  text: "22 September 2025",
                                  controller:
                                      controller.dueDateEnteringController)
                            ],
                          ),
                          SizedBox(
                            height: Get.size.height * 0.009,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              smalltextfield(
                                  hinttext: "Notes",
                                  controller: controller.ponController),
                              SizedBox(
                                width: Get.size.width * 0.03,
                              ),
                              mediumTextField(
                                  text: "Additional information",
                                  controller: controller.ponDataController)
                            ],
                          ),
                          SizedBox(
                            height: Get.size.height * 0.009,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              smalltextfield(
                                  hinttext: "Bill type",
                                  controller:
                                      controller.paymentTermsController),
                              SizedBox(
                                width: Get.size.width * 0.03,
                              ),
                              mediumTextField(
                                  text: "Online/Cash",
                                  controller:
                                      controller.paymentTermsDataController)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.size.height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: Get.size.width * 0.6,
                          child: Row(
                            children: [
                              const Text(
                                "Bill To",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              const Text("Ship To Address",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.11,
                              ),
                               const Expanded(
                                 child: Text("Contact No",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500)),
                               )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          optionalTextfield(
                              controller: controller.invoiceToController,
                              tttt: "Who is this invoice to? (required)"),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          optionalTextfield(
                              tttt: "Address-Shipping",
                              controller: controller.billToController),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          optionalTextfield(
                              tttt: "Mobile No-Shipping",
                              controller: controller.mobileToController)
                        ],
                      ),
                      SizedBox(
                        height: Get.size.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: Get.size.width * 0.6,
                          child: const Text("Email-id",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      optionalTextfield(
                          tttt: "Email-Id-Shipping",
                          controller: controller.emailToController),
                      SizedBox(
                        height: Get.size.height * 0.03,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.black,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                "  Item",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            const Text(
                              "Quantity",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.045,
                            ),
                            const Text(
                              "Rate",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.049,
                            ),
                            const Expanded(
                              child: Text(
                                "Amount",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.size.height * 0.01,
                      ),
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: controller.textFields.toList(),
                        ),
                      ),
                      SizedBox(
                        height: Get.size.height * 0.0009,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2))),
                          onPressed: () {
                            controller.addRow();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Add an Item",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: buildAmountPaidTextField(
                                  hintText: "Bank Name",
                                  keyboardType: TextInputType.text,
                                  controller: controller.notes1Controller,
                                  textAlign: TextAlign.start)),
                          Expanded(
                              child: buildAmountPaidTextField(
                                  keyboardType: TextInputType.number,
                                  hintText: "Discount",
                                  controller: controller.discountController,
                                  textAlign: TextAlign.end)),
                          Expanded(
                              child: buildCustomTextField(
                                  prefixText: "%",
                                  controller:
                                      controller.discountDataController))
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.023,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: buildTermsAndConditionsTextField(
                                  controller: controller.noteInfoController,
                                  hinttext:
                                      "Enter Bank No")),
                          Expanded(
                              child: buildAmountPaidTextField(
                                  controller: controller.subtotalController,
                                  hintText: "SubTotal",
                                  textAlign: TextAlign.end)),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => Text(
                                controller.totalPrice
                                    .fold(
                                        0.0,
                                        (previousValue, element) =>
                                            previousValue + element)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 26),
                              ),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.023,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: buildAmountPaidTextField(
                                  hintText: "Account No",
                                  controller: controller.notes2Controller,
                                  textAlign: TextAlign.start)),
                          Expanded(
                              child: buildAmountPaidTextField(
                                  controller: controller.taxController,
                                  hintText: "Mode",
                                  textAlign: TextAlign.end)),
                          Expanded(
                              child: buildCustomTextField(
                                  prefixText: "",
                                  controller: controller.taxDataController))
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.023,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: buildTermsAndConditionsTextField(
                                  controller:
                                      controller.termsConditionsController,
                                  hinttext: "Account Number")),
                          Expanded(
                            child: buildAmountPaidTextField(
                              controller: controller.amountPaidController,
                              textAlign: TextAlign.end,
                              hintText: "Amount Paid",
                            ),
                          ),
                          Expanded(
                            child: buildCustomTextField(
                              prefixText: "Rs",
                              controller: controller.amountPaidDataController,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.023,
                      ),
                      Column(
                        children: [
                          Container(
                              child: buildTermsAndConditionsTextField(
                                  controller: controller.bankEmailController,
                                  hinttext: "Email")),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Signature(
                                controller: controller.signatureController,
                                width: Get.width * 0.2,
                                height: Get.height * 0.2,
                                backgroundColor: Colors.lightBlue[100]!,
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green.shade700,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2))),
                                onPressed: () {
                                  controller.signatureController.clear();
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.width * 0.07,
                        width: Get.width * 0.02,
                      ),
                      Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          onPressed: () async {
                            if (controller.signatureController.isEmpty && controller.titleController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please Check required fields are filled or not'),
                                ),
                              );
                            }
                            else if (controller.imageBytes.value?.isEmpty ?? true) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please Add Your Logo.'),
                                ),
                              );
                            }
                            else if (controller.signatureController.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in the Signature field.'),
                                ),
                              );
                            } else if (controller.titleController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in the Title field.'),
                                ),
                              );
                            }
                            else if (controller.invoiceFromController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill the Name.'),
                                ),
                              );
                            }
                            else if (controller.invoiceToController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill the name of Billing person.'),
                                ),
                              );
                            }
                            else if (controller.dateEnteringController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill the Date.'),
                                ),
                              );
                            }
                            else if (controller.dueDateEnteringController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in Due Date'),
                                ),
                              );
                            }

                            else if (controller.billToController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in Address Invoice To'),
                                ),
                              );
                            }
                            else if (controller.mobileToController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in mobile Invoice To'),
                                ),
                              );
                            }
                            else if (controller.emailToController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in Email Invoice To'),
                                ),
                              );
                            }
                            else if (controller.noteInfoController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in the field'),
                                ),
                              );
                            }

                            else if (controller.bankEmailController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in the field'),
                                ),
                              );
                            }
                            else if (controller.termsConditionsController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in the field'),
                                ),
                              );
                            }
                            else if (controller.titleCodeController.text.isEmpty) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in the Title Code Field.'),
                                ),
                              );
                            }
                            else {

                              final Uint8List? signatureImage = await controller.signatureController.toPngBytes();
                              if (signatureImage != null) {
                                await controller.generateTextToPdf(signatureImage);
                                controller.signatureController.clear();
                                controller.titleController.clear();
                               // controller.imageBytes.value = null;
                                controller.titleCodeController.clear();
                                controller.termsConditionsController.clear();
                                controller.bankEmailController.clear();
                                controller.noteInfoController.clear();
                                controller.emailToController.clear();
                                controller.mobileToController.clear();
                                controller.billToController.clear();
                                controller.dueDateEnteringController.clear();
                                controller.dateEnteringController.clear();
                                controller.discountDataController.clear();
                                controller.subToTalDataController.clear();
                                controller.notes1Controller.clear();
                                controller.amountPaidDataController.clear();
                                controller.taxDataController.clear();
                                controller.invoiceFromController.clear();
                                controller.invoiceToController.clear();
                                controller.itemNameController.clear();
                                controller.emailToController.clear();
                                controller.ponDataController.clear();
                                controller.paymentTermsDataController.clear();
                                controller.paymentTermsController.clear();
controller.textFields.clear();
controller.totalPrice.clear();
                                controller.imageBytes.value = Uint8List(0);

                              }
                              else {
                                return;
                                //print("Error: Image data is null");
                              }
                            }
                          },
                          icon: const Icon(
                            Icons.print,
                            color: Colors.white,
                            size: 30,
                          ),
                          label: const Text(
                            "EXPORT BILL",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )



                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
