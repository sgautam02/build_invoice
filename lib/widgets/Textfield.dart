import 'package:flutter/material.dart';
import 'package:get/get.dart';



Widget buildTermsAndConditionsTextField({
  required String hinttext, required TextEditingController controller,
}) {
  return SizedBox(
    width: Get.width * 0.29,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hinttext,
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
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.green),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    ),
  );
}

Widget buildAmountPaidTextField({
  required String hintText,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  TextAlign textAlign = TextAlign.start,
}) {
  final FocusNode focusNode = FocusNode();

  focusNode.addListener(() {
    if (!focusNode.hasFocus && controller.text.isEmpty) {
      controller.text = hintText;
    }
  });


  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (controller.text.isEmpty) {
      controller.text = hintText;
    }
  });

  return Expanded(
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      textAlign: textAlign,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 8),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    ),
  );
}

Widget smalltextfield({
  required String? hinttext,
  required TextEditingController controller,
}) {
  return SizedBox(
    height: Get.height * 0.04,
    width: Get.width * 0.09,
    child: TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.end,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 9.0,
          horizontal: 8.0,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      onEditingComplete: () {
        if (controller.text.isEmpty) {
          controller.text = hinttext ?? '';
        }
      },
    ),
  );
}

Widget smallSmallTextField({
  required String? hintText,
  required TextEditingController controller,
}) {
  return SizedBox(
    height: Get.height * 0.04,
    width: Get.width * 0.09,
    child: TextField(
      readOnly: true,
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.end,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 9.0,
          horizontal: 8.0,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    ),
  );
}


Widget mediumTextField({required String text, required TextEditingController controller}){
  return  SizedBox(
    width:
    Get.size.width * 0.17,
    child: TextField(
      controller: controller,
      maxLines: 1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText:text,
        hintStyle: const TextStyle(
          height: 1,
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(1),
          borderSide: const BorderSide(
              color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(1),
          borderSide: const BorderSide(
              color: Colors.green),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(1),
          borderSide: const BorderSide(
              color: Colors.red),
        ),
      ),
    ),
  );
}

Widget buildCustomTextField({required TextEditingController controller, required String prefixText,}) {
  return SizedBox(
    width: Get.width * 0.08,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText:"",
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
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.green),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.red),
        ),
          prefixText: prefixText,suffixStyle: const TextStyle(color: Colors.grey,fontSize: 22)
      ),
    ),
  );
}

Widget optionalTextfield({required String tttt,required TextEditingController controller}){
  return SizedBox(
    width:Get.size.width * 0.17,
    child: TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        hintText: tttt,
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
  );
}