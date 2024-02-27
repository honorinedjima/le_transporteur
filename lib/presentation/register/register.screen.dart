import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:le_transporteur/infrastructure/widgets/button_widget.dart';
import 'package:le_transporteur/infrastructure/widgets/checkbox_widget.dart';
import 'package:le_transporteur/infrastructure/widgets/text_form_field.dart';
import 'package:le_transporteur/infrastructure/widgets/text_widget.dart';

import '../../infrastructure/utils/text_fr.dart';
import '../../infrastructure/widgets/dropdownButton_widget.dart';
import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.controllerPageView,
        onPageChanged: (int index) {
          controller.indexPageView.value = index;
        },
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 247.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        //Image.asset("img_rectangle_27.png"),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 120.0)),
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/img_rectangle_27.png"),
                          fit: BoxFit
                              .cover, // Ajustez l'image à la taille du conteneur
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: MediaQuery.of(context).size.height / 6),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40.0, horizontal: 30.0),
                            child: Form(
                              key: controller.formKeyStep,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const TextWidget(
                                    text: TextFr.INSCRIVEZ_VOUS,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                  const TextWidget(
                                    text: TextFr.Infos_INSCRIPTION,
                                    fontSize: 17,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.05,
                                  ),
                                  AuthInputWidget(
                                    validator: (value) {
                                      if (/*value!.trim().isEmpty*/ GetUtils.isBlank(value)==true) {
                                        return "Veuillez entrer votre nom";
                                      }
                                      // Vérifier si la valeur contient des chiffres
                                      RegExp regex = RegExp(r'\d');
                                      if (regex.hasMatch(value!)) {
                                        return "Le nom ne peut pas contenir de chiffres";
                                      }
                                      return null;
                                    },
                                    controller: controller.nomController,
                                    hint: TextFr.NOM,
                                    icon: Icons.person,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  AuthInputWidget(
                                    validator: (value) {
                                      if (/*value!.trim().isEmpty*/ GetUtils.isBlank(value)==true) {
                                        return "Veuillez entrer votre prénom";
                                      }
                                      // Vérifier si la valeur contient des chiffres
                                      RegExp regex = RegExp(r'\d');
                                      if (regex.hasMatch(value!)) {
                                        return "Le nom ne peut pas contenir de chiffres";
                                      }
                                      return null;
                                    },
                                    controller: controller.prenomController,
                                    hint: TextFr.PRENOM,
                                    icon: Icons.person,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  AuthInputWidget(
                                    controller: controller.telephoneController,
                                    hint: TextFr.TELEPHONE,
                                    icon: Icons.phone,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  AuthInputWidget(
                                    validator: (value){
                                      if (/*value!.trim().isEmpty*/ GetUtils.isBlank(value)==true) {
                                        return "Veuillez entrer votre date de naissance";
                                      }

                                      DateTime selectedDate= DateTime.parse(value!);
                                      DateTime today = DateTime.now();
                                      
                                      if(selectedDate.isAfter(today)){
                                        return "La date de naissance ne peut pas être postérieure \n à la date d'aujourd'hui";
                                      }
                                      return null;
                                    },
                                    controller:
                                        controller.dateNaissanceController,
                                    readOnly: true,
                                    OnTap: () {
                                      controller.selectedBirthDate(context);
                                    },
                                    hint: TextFr.DATE_NAISSANCE,
                                    icon: Icons.calendar_month,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.05,
                                  ),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    child: AuthButton(
                                      text: TextFr.BUTTON_CONTINUER_REGISTER,
                                      onPressed: () {
                                        final isValid =
                                        controller.formKeyStep.currentState!.validate();
                                        if (!isValid) {
                                          return;
                                        }
                                        //controller.formKeyStep.currentState?.save();
                                        controller.nextPageView();

                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: TextFr.DEJA_INSCRIT,
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: TextFr.CONNECTEZ_VOUS,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 247.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        //Image.asset("img_rectangle_27.png"),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 120.0)),
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/img_rectangle_27.png"),
                          fit: BoxFit
                              .cover, // Ajustez l'image à la taille du conteneur
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: MediaQuery.of(context).size.height / 6),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 40.0, horizontal: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const TextWidget(
                                  text: TextFr.FINALISER_VOTRE_INSCRIPTION,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                                const TextWidget(
                                  text: TextFr.Infos_INSCRIPTION_FINAL,
                                  fontSize: 17,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                ),
                                AuthInputWidget(
                                  validator: (value){
                                    if (/*value!.trim().isEmpty*/ GetUtils.isBlank(value)==true) {
                                      return "Veuillez entrer un mot de passe";
                                    }
                                    if (value!.length < 8) {
                                      return 'Le mot de passe doit contenir au moins 8 caractères';
                                    }
                                    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>]).{8,}$');
                                    if(!regex.hasMatch(value!)){
                                      return "Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial";
                                    }
                                    return null;
                                  },
                                  controller: controller.passwordController,
                                  hint: TextFr.PASSWORD,
                                  icon: Icons.lock,
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                AuthInputWidget(
                                  validator: (value){
                                    if (/*value!.trim().isEmpty*/ GetUtils.isBlank(value)==true) {
                                      return "Veuillez confirmer le mot de passe";
                                    }

                                    print(controller.passwordController.text);
                                    if(controller.passwordConfirmController.text != controller.passwordController.text){
                                      return "Les deux mots passe doivent être identiques";
                                    }
                                    return null;
                                  },
                                  controller:
                                      controller.passwordConfirmController,
                                  hint: TextFr.COMFIRM_PASSWORD,
                                  icon: Icons.lock,
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                    //hintText: hint,
                                    //prefixIcon: Icon(icon),
                                    //fillColor: Color(0XFFF2F2F2),
                                    color: const Color(0XFFF2F2F2),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(8.0)),
                                    border: Border.all(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      border: OutlineInputBorder(borderSide: BorderSide.none),
                                    ),
                                    hint: const TextWidget(
                                        text: TextFr.QUESTION_SECURITE),
                                    isExpanded: true,
                                    //value: dropdownValue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    elevation: 16,
                                    //style: const TextStyle(color: Colors.deepPurple),
                                    // underline: Container(
                                    //   height: 2,
                                    //   color: Colors.deepPurpleAccent,
                                    // ),
                                    onChanged: (String? value) {},
                                    items: controller.list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                // AuthInputWidget(
                                //   controller: controller
                                //       .reponseQuestionSecuriteController,
                                //   hint: TextFr.REPONSE_QUIZ_SECU,
                                // ),
                                AuthInputWidget(
                                  controller: controller
                                      .reponseQuestionSecuriteController,
                                  hint: TextFr.REPONSE_QUIZ_SECU,
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                AuthInputWidget(
                                  controller: controller.villeController,
                                  hint: TextFr.VILLE,
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => CheckboxWidget(
                                        value: controller.isChecked.value,
                                        onChanged: (bool? value) {
                                          controller.isChecked.value = value!;
                                          print(value);
                                        },
                                      ),
                                    ),
                                    TextWidget(
                                        text: TextFr.UTILISER_CODE_PARRAIN),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                AuthInputWidget(
                                  controller: controller.codeParrainController,
                                  hint: TextFr.CODE_PARRAIN,
                                ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                ),
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  child: AuthButton(
                                    text: TextFr.BUTTON_CONTINUER_REGISTER,
                                    onPressed: () {
                                      print("OnPressed");
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                      iconColor: Colors.black,
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(50, 30),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      alignment: Alignment.centerLeft),
                                  icon: Icon(
                                    Icons.arrow_back,
                                  ),
                                  onPressed: () {
                                    controller.previousPageView();
                                  },
                                  label: TextWidget(
                                    text: TextFr.PREVIOUS_REGISTER,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
