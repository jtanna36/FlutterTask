import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo1/Providers/ProviderClass.dart';
import 'package:flutterdemo1/UI/AddressPage.dart';
import 'package:flutterdemo1/util/Common.dart';
import 'package:flutterdemo1/util/common_utils.dart';
import 'package:flutterdemo1/widgets/CustomDropDown.dart';
import 'package:flutterdemo1/widgets/CustomTextField.dart';
import 'package:flutterdemo1/widgets/Label.dart';
import 'package:provider/provider.dart';

class YourInfo extends StatefulWidget {
  @override
  _YourInfoState createState() => _YourInfoState();
}

class _YourInfoState extends State<YourInfo> {
  TextEditingController educationController = new TextEditingController();
  TextEditingController yearOfPassingController = new TextEditingController();
  TextEditingController gradeController = new TextEditingController();
  TextEditingController experienceController = new TextEditingController();
  TextEditingController designationController = new TextEditingController();
  TextEditingController domainController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var educationVal = Provider.of<ProviderClass>(context).getEducationValue();
    if (educationVal == 0) {
      educationController.text =
          EnumToString.convertToString(Education.Post_Graduate);
    } else if (educationVal == 1) {
      educationController.text =
          EnumToString.convertToString(Education.Graduate);
    } else if (educationVal == 2) {
      educationController.text =
          EnumToString.convertToString(Education.HSC_Diploma);
    } else if (educationVal == 3) {
      educationController.text = EnumToString.convertToString(Education.SSC);
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "Your Info",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Educational Info",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Label("Education*"),
                  CustomDropDown(
                      hint: "Select your Qualification",
                      icon: Icons.arrow_drop_down,
                      controller: educationController,
                      context: context,
                      type: "Education"),
                  SizedBox(
                    height: 10,
                  ),
                  Label("Year of Passing*"),
                  CustomeTextField(
                    hint: "Enter year of passing",
                    inputType: TextInputType.number,
                    controller: yearOfPassingController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Label('Grade*'),
                  CustomeTextField(
                      hint: "Enter your grade or percentage",
                      controller: gradeController),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Professional Info",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Label("Experience*"),
                  CustomeTextField(
                      hint: "Enter the years of experience",
                      controller: experienceController,
                      inputType: TextInputType.number),
                  SizedBox(
                    height: 10,
                  ),
                  Label("Designation*"),
                  CustomeTextField(
                      hint: "Select Designation",
                      controller: designationController),
                  SizedBox(
                    height: 10,
                  ),
                  Label("Domain"),
                  CustomeTextField(
                      hint: "Select Your Domain", controller: domainController),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            //Navigator.push(context,MaterialPageRoute(builder: (context)=>RegistrationPage()));
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Color(0xFF0A5189))),
                          child: Text(
                            "Previous",
                            style: TextStyle(
                                fontSize: 25, color: Color(0xFF0A5189)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            if (!RegExp(r"^[a-z|A-Z|0-9]*$")
                                .hasMatch(gradeController.text)) {
                              show(context,
                                  "grade should only be entered in numbers or alphabets");
                            } else if (!RegExp(r"^[a-z|A-Z|0-9|\s]*$")
                                .hasMatch(designationController.text)) {
                              show(context,
                                  "designation should only be entered in numbers or alphabets");
                            } else if (!RegExp(r"^[a-z|A-Z|0-9|\s]*$")
                                .hasMatch(domainController.text)) {
                              show(context,
                                  "domain should only be entered in numbers or alphabets");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddressPage()));
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF0A5189)),
                          child: Text(
                            "Next",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
