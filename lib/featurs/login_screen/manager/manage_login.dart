// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:investa4/core/apis/login.dart';
import 'package:investa4/core/model/user.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/nasar/setup_screen.dart';
// import 'package:investa4/featurs/dashboard/presentation/dashboard.dart';

class ManageLogin {
  ValueNotifier<bool> rebuildNextButton = ValueNotifier<bool>(false);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  checkLoginVerification({required BuildContext context}) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    rebuildNextButton.value = true;
    SignResult? result = await login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (result != null) {
      checkAndSaveUser(result);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SetupScreen()),
        // MaterialPageRoute(builder: (context) => MainLayout()),
        (Route<dynamic> route) => false,
      );
    }
    rebuildNextButton.value = false;
  }
}

UserModel checkAndSaveUser(SignResult result) {
  UserModel? userinDb = UserMethods.getUserByGuid(result.userId);
  if (userinDb != null) {
    userinDb.signedUp = true;
    UserMethods.updateUser(userinDb);
    ManageCurrentUser.currentUser = userinDb;
    return userinDb;
  }
  UserModel user = UserModel(
    id: randomInt(),
    email: result.email,
    username: result.userNAme,
    guid: result.userId,
    signedUp: true,
    birthdate: result.dateOffBirth,
  );
  UserMethods.saveUser(user);
  ManageCurrentUser.currentUser = user;
  return user;
}

int randomInt() {
  return DateTime.now().millisecondsSinceEpoch;
}
