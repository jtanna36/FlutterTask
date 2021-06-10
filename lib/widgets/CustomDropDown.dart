import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo1/Providers/ProviderClass.dart';
import 'package:flutterdemo1/util/Common.dart';
import 'package:provider/provider.dart';

class CustomDropDown extends StatefulWidget {
  var hint;
  TextEditingController controller = new TextEditingController();
  var icon;
  var type;
  BuildContext context;

  CustomDropDown({this.hint,this.controller,this.icon,this.type,this.context});

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    if(widget.type=="State")
    {
      var stateValue = Provider.of<ProviderClass>(context).getStateValue();
      if (stateValue == 0) {
        widget.controller.text = EnumToString.convertToString(States.MAHARASHTRA);
      }
      else if (stateValue == 1) {
        widget.controller.text = EnumToString.convertToString(States.GUJARAT);
      }
      else if (stateValue == 2) {
        widget.controller.text = EnumToString.convertToString(States.KARNATAKA);
      }
      else if (stateValue == 3) {
        widget.controller.text = EnumToString.convertToString(States.MADHYA_PRADESH);
      }
      else if (stateValue == 4) {
        widget.controller.text = EnumToString.convertToString(States.DELHI);
      }
      else if (stateValue == 5) {
        widget.controller.text = EnumToString.convertToString(States.OTHERS);
      }
    }

    if(widget.type=="Education")
      {
        var educationVal = Provider.of<ProviderClass>(context).getEducationValue();
        if (educationVal == 0) {
          widget.controller.text =
              EnumToString.convertToString(Education.Post_Graduate);
        }
        else if (educationVal == 1) {
          widget.controller.text =
              EnumToString.convertToString(Education.Graduate);
        }
        else if (educationVal == 2) {
          widget.controller.text =
              EnumToString.convertToString(Education.HSC_Diploma);
        }
        else if (educationVal == 3) {
          widget.controller.text =
              EnumToString.convertToString(Education.SSC);
        }
      }
    showPicker(var type) {
      type == "Education" ? showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return CupertinoPicker(
              backgroundColor: Colors.white,
              onSelectedItemChanged: (value) {
                Provider.of<ProviderClass>(context, listen: false)
                    .changeEducationValue(value);
              },
              itemExtent: 32.0,
              children: [
                Text(EnumToString.convertToString(Education.Post_Graduate)),
                Text(EnumToString.convertToString(Education.Graduate)),
                Text(EnumToString.convertToString(Education.HSC_Diploma)),
                Text(EnumToString.convertToString(Education.SSC)),
              ],
            );
          }): showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return CupertinoPicker(
              backgroundColor: Colors.white,
              onSelectedItemChanged: (value) {
                Provider.of<ProviderClass>(context, listen: false)
                    .changeStateValue(value);
              },
              itemExtent: 32.0,
              children: [
                Text(EnumToString.convertToString(States.MAHARASHTRA)),
                Text(EnumToString.convertToString(States.GUJARAT)),
                Text(EnumToString.convertToString(States.KARNATAKA)),
                Text(EnumToString.convertToString(States.MADHYA_PRADESH)),
                Text(EnumToString.convertToString(States.DELHI)),
                Text(EnumToString.convertToString(States.OTHERS)),
              ],
            );
          });
    }

    return widget.type == "Education" ? Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                enabled: false,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(widget.icon),
              onPressed: () {
                print("hello");
                showPicker("Education");
              },
            ),
          ],
        ),
      ),
    ): Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                enabled: false,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(widget.icon),
              onPressed: () {
                print("hello");
                showPicker("State");
              },
            ),
          ],
        ),
      ),
    );
  }
}
