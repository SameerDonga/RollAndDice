import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {

  bool _isAdmin;
  bool get isAdmin => _isAdmin;
  init() async {
    notifyListeners();
  }

  userUpdateAdmin(bool data){
    _isAdmin = data;
    notifyListeners();
  }


}