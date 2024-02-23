import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../infrastructure/utils/share_function.dart';

class RegisterController extends GetxController {
  PageController controllerPageView = PageController(
    initialPage: 0,
  );


  
  final indexPageView= 0.obs;

  final isChecked = false.obs;

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  final formKeyStep = GlobalKey<FormState>();
  

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController dateNaissanceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController questionSecuriteController = TextEditingController();
  TextEditingController reponseQuestionSecuriteController =
      TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController utiliserCodeParrainController = TextEditingController();
  TextEditingController codeParrainController = TextEditingController();

  //final selectedBirthDay="".obs;

  Future<void> selectedBirthDate(context) async {

    String selectedBirthDay = await selectedDate(context);
    dateNaissanceController.text = selectedBirthDay;
    //selectedBirthDay.value= selectedBirthDay;
  }
  
  
  void nextPageView(){
    controllerPageView.nextPage(duration: Duration(milliseconds: 10), curve: Curves.linear);
  }

  void previousPageView(){
    controllerPageView.previousPage(duration: Duration(milliseconds: 10), curve: Curves.linear);
  }
}
