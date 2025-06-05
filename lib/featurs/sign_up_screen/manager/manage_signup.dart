import 'package:flutter/widgets.dart';
import 'package:investa4/core/model/user.dart';

class ManageSignUp {
  ValueNotifier<bool> rebuildDoneButton = ValueNotifier<bool>(false);
  ValueNotifier<bool> rebuildPasswordValideItem = ValueNotifier<bool>(false);
  late UserModel userModel;
  bool atLeast8Character = false;
  bool atLeast8Number = false;
  bool bothUpperAndLower = false;
}
