import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:le_transporteur/infrastructure/utils/text_fr.dart';
import 'package:le_transporteur/infrastructure/widgets/text_widget.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return
      DropdownButton<String>(
      hint: TextWidget(text: TextFr.QUESTION_SECURITE),
      //value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
