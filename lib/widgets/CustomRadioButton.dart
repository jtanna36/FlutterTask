import 'package:flutter/material.dart';
import 'package:flutterdemo1/Providers/ProviderClass.dart';
import 'package:flutterdemo1/util/Common.dart';
import 'package:provider/provider.dart';

class CustomRadioButton extends StatefulWidget {
  String label;
  var value;

  CustomRadioButton({this.label,this.value});
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    var _val = Provider.of<ProviderClass>(context).getGenderValue();
    return Row(
      children: [
        Radio(
          //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity(horizontal: -4, vertical: 0),
          activeColor: Color(0xFF0A5189),
          value: widget.value,
          groupValue: _val,
          onChanged: (var val) {
            Provider.of<ProviderClass>(context,listen: false).changeGenderValue(val);
            print(_val);
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
