// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:investa4/core/apis/login.dart';
import 'package:investa4/core/model/user.dart';
import 'package:investa4/core/utils/manage_current_user.dart' as current_user;
import 'package:investa4/nasar/founderHome_screen.dart';
import 'package:investa4/nasar/home_screen.dart';
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
      UserModel user = checkAndSaveUser(result);
      if (user.userIsFounder == true) {
        current_user.ManageCurrentUser.currentUser = user;
        // Navigate to Founder Home Screen
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder:
                (context) => const FounderHomeScreen(projectId: 'wefuwenk'),
          ),
          (Route<dynamic> route) => false,
        );
        return;
      } else if (user.userIsFounder == false) {
        // Navigate to Home Screen
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false,
        );
        return;
      }
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SetupScreen()),
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
    current_user.ManageCurrentUser.currentUser = userinDb;
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
  current_user.ManageCurrentUser.currentUser = user;
  return user;
}

int randomInt() {
  return DateTime.now().millisecondsSinceEpoch;
}
