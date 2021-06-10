import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterdemo1/util/Common.dart';

class ProviderClass extends ChangeNotifier
{
  var genderVal = Gender.Male;
  int educationValue;
  int cityValue;

  int getCityValue()
  {
    return cityValue;
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

  void changeCityValue(var val)
  {
    cityValue= val;
    notifyListeners();
  }
}