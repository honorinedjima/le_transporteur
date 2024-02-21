import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String> selectedDate(context) async {

  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2100));
  String formattedDate ="";

  if (pickedDate != null) {
    print(
        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
     formattedDate =
    DateFormat('yyyy-MM-dd').format(pickedDate);
    print(
        formattedDate);//formatted date output using intl package =>  2021-03-16
    // dateNaissanceController.text=formattedDate;
    // selectedBirthDay.value= formattedDate;
  } else {

  }
  return formattedDate;
}