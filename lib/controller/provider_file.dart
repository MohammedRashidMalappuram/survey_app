import 'package:flutter/material.dart';

class ProviderFile with ChangeNotifier {
  int pageindex = 1;
  int buttonindex = -1;

  void changevale() {
    pageindex++;
    notifyListeners();
  }

  void toch(index) {
    buttonindex = index;
    notifyListeners();
  }
}
