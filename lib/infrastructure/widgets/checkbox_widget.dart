import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({Key? key, this.value=false, this.onChanged}) : super(key: key);
  final bool value;

  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        checkColor: Colors.white,
        //fillColor: MaterialStateProperty.resolveWith(getColor),
        value: value,
        onChanged: onChanged,

    );
  }
}
