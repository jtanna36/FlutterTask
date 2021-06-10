import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterdemo1/util/Common.dart';

class ProviderClass extends ChangeNotifier
{
  var genderVal = Gender.Male;
  int educationValue;
  int stateValue;

  int getStateValue()
  {
    return stateValue;
  }

  int getEducationValue()
  {
    return educationValue;
  }

  Gender getGenderValue()
  {
    return genderVal;
  }

  void changeGenderValue(var val){
    genderVal = val;
    notifyListeners();
  }

  void changeEducationValue(var val)
  {
    educationValue = val;
    notifyListeners();
  }

  void changeStateValue(var val)
  {
    stateValue= val;
    notifyListeners();
  }
}