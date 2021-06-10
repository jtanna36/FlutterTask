import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/HP/Desktop/flutter_projects_neosoft/flutterdemo1/lib/Providers/ProviderClass.dart';
import 'package:flutterdemo1/UI/AddressPage.dart';
import 'package:flutterdemo1/UI/YourInfoPage.dart';
import 'package:flutterdemo1/util/Common.dart';
import 'package:flutterdemo1/util/sputils.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _val = Provider.of<ProviderClass>(context).getGenderValue();
    Widget getRadioButton(String label, Gender val) {
      return Row(
        children: [
          Radio(
            //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity(horizontal: -4, vertical: 0),
            activeColor: Color(0xFF0A5189),
            value: val,
            groupValue: _val,
            onChanged: (Gender genderVal) {
              Provider.of<ProviderClass>(context,listen: false).changeGenderValue(val);
              print(_val);
            },
          ),
          Text(label),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Register",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Center(
                    child: CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        backgroundImage:
                        AssetImage("assets/images/profile.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                getLabel("First Name*"),
                CustomeTextField(
                  hint: "Enter your first name here",
                  icon: Icons.person,
                  isIconNeeded: true,
                  controller: firstNameController,
                ),
                SizedBox(
                  height: 10,
                ),
                getLabel("Last Name*"),
                CustomeTextField(
                  hint: "Enter your last name here",
                  icon: Icons.person,
                  isIconNeeded: true,
                  controller: lastNameController,
                ),
                SizedBox(
                  height: 10,
                ),
                getLabel("Phone Number*"),
                CustomeTextField(
                  hint: "Enter your 10 digit mobile number",
                  icon: Icons.call,
                  isIconNeeded: true,
                  controller: phoneController,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                getLabel("Email*"),
                CustomeTextField(hint: "your email goes here",
                  icon: Icons.email,
                  isIconNeeded: true,
                  controller: emailController,),
                getLabel("Gender"),
                Row(
                  children: [
                    getRadioButton("Male", Gender.Male),
                    getRadioButton("Female", Gender.Female),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                getLabel("Password*"),
                CustomeTextField(
                  hint: "Password",
                  icon: Icons.lock,
                  isObscure: true,
                  isIconNeeded: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 10,
                ),
                getLabel("Confirm Password"),
                CustomeTextField(
                  hint: "Confirm Password",
                  icon: Icons.lock,
                  isObscure: true,
                  isIconNeeded: true,
                  controller: confirmPasswordController,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF0A5189)),
                    onPressed: () {
                      if (!RegExp(r"^[a-z|A-Z]{3,}$")
                          .hasMatch(firstNameController.text)) {
                        show(context, "Please enter valid first name");
                      }
                      else if (!RegExp(r"^[a-z|A-Z]{3,}$")
                          .hasMatch(lastNameController.text)) {
                        show(context, "Please enter valid last name");
                      }
                      else if (!RegExp(
                          r"^[a-z|A-Z][a-z|A-Z|0-9]*[@][a-z|A-Z]*[\.][a-z]{2,3}$")
                          .hasMatch(emailController.text)) {
                        show(context, "Please enter valid email address");
                      }
                      else if (phoneController.text.length != 10) {
                        show(context,"Please enter valid Phone number");
                      }
                      else if (!RegExp(
                          r".*([0-9]+[@$!%*#?&]|[@$!%*#?&]+[0-9]){1,}.*")
                          .hasMatch(passwordController.text)) {
                        show(context,"Password should contain atleast 1 number and 1 special character");
                      }
                      else if (passwordController.text !=
                          confirmPasswordController.text) {
                        show(context,"Password doesn't match");
                      }
                      else {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => YourInfo()));
                      }
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



