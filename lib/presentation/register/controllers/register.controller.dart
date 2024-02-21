import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../infrastructure/utils/share_function.dart';

class RegisterController extends GetxController {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController dateNaissanceController = TextEditingController();

  //final selectedBirthDay="".obs;

  Future<void> selectedBirthDate(context) async {
    String selectedBirthDay = await selectedDate(context);
    dateNaissanceController.text=selectedBirthDay;
    //selectedBirthDay.value= selectedBirthDay;
  }

}
