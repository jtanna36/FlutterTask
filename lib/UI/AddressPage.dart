import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo1/Providers/ProviderClass.dart';
import 'package:flutterdemo1/util/Common.dart';
import 'package:flutterdemo1/util/common_utils.dart';
import 'package:flutterdemo1/widgets/CustomDropDown.dart';
import 'package:flutterdemo1/widgets/CustomTextField.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController stateController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController landmarkController = new TextEditingController();
  TextEditingController pincodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cityValue = Provider.of<ProviderClass>(context).getStateValue();
    if (cityValue == 0) {
      stateController.text = EnumToString.convertToString(States.MAHARASHTRA);
    } else if (cityValue == 1) {
      stateController.text = EnumToString.convertToString(States.GUJARAT);
    } else if (cityValue == 2) {
      stateController.text = EnumToString.convertToString(States.KARNATAKA);
    } else if (cityValue == 3) {
      stateController.text =
          EnumToString.convertToString(States.MADHYA_PRADESH);
    } else if (cityValue == 4) {
      stateController.text = EnumToString.convertToString(States.DELHI);
    } else if (cityValue == 5) {
      stateController.text = EnumToString.convertToString(States.OTHERS);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Your Address",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
          child: Column(
            children: [
              CustomeTextField(
                  hint: "Address",
                  icon: Icons.apartment,
                  isIconNeeded: true,
                  controller: addressController),
              SizedBox(
                height: 10,
              ),
              CustomeTextField(
                  hint: "Landmark",
                  icon: Icons.apartment,
                  isIconNeeded: true,
                  controller: landmarkController),
              SizedBox(
                height: 10,
              ),
              CustomeTextField(
                  hint: "city",
                  icon: Icons.apartment,
                  isIconNeeded: true,
                  controller: cityController),
              SizedBox(
                height: 10,
              ),
              CustomDropDown(
                  hint: "Select your state",
                  icon: Icons.arrow_drop_down,
                  controller: stateController,
                  context: context,
              type: "State",),
              SizedBox(
                height: 10,
              ),
              CustomeTextField(
                  hint: "Pin Code",
                  icon: Icons.apartment,
                  isIconNeeded: true,
                  controller: pincodeController,
                  inputType: TextInputType.number),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (!RegExp(r"^[a-z|A-Z|0-9|\s]{3,}$")
                        .hasMatch(addressController.text)) {
                      show(context,
                          "Address should contain atleast 3 characters");
                    } else if (!RegExp(r"^[a-z|A-Z|0-9|\s]{3,}$")
                        .hasMatch(landmarkController.text)) {
                      show(context,
                          "Landmark should contain atleast 3 characters");
                    } else if (!RegExp(r"^[a-z|A-Z]*$")
                        .hasMatch(cityController.text)) {
                      show(context, "please enter a valid city");
                    } else if (pincodeController.text.length != 6) {
                      show(context, "Please enter a valid pincode");
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(
                                title: Text("Submitted"),
                                content:
                                Text("User sucessfully registered"),
                                actions: [closeDialog(context)],
                              ));
                    }
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFF0A5189)),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
