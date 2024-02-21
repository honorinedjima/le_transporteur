import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:le_transporteur/infrastructure/widgets/button_widget.dart';
import 'package:le_transporteur/infrastructure/widgets/text_form_field.dart';
import 'package:le_transporteur/infrastructure/widgets/text_widget.dart';

import '../../infrastructure/utils/text_fr.dart';
import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
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
                      image: AssetImage("assets/images/img_rectangle_27.png"),
                      fit: BoxFit.cover, // Ajustez l'image à la taille du conteneur
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: MediaQuery.of(context).size.height / 6),
                    child: Card(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 30.0),
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
                                controller: controller.nomController,
                                hint: TextFr.NOM,
                                icon: Icons.person,
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              AuthInputWidget(
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
                                controller: controller.dateNaissanceController,
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
                                    print("OnPressed");
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
      )),
    );
  }
}
