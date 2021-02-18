
import 'package:flutter/material.dart';
import 'package:rollanddice/ui/views/base_model.dart';
import 'package:rollanddice/models/Users.dart';
class LeaderBoardViewModel extends BaseModel{
  LeaderBoardViewModel(BuildContext buildContext){
    context = buildContext;
  }
  User users;
}