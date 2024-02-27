import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/accueil.controller.dart';

class AccueilScreen extends GetView<AccueilController> {
  const AccueilScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccueilScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccueilScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
