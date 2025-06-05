
import 'dart:developer';

import 'package:flutter/material.dart';

class ManageCommentAnimation {
  late AnimationController animationController;
  late Animation<Offset> animation;

  void openDrawer() {
    log('ManageCommentAnimation openDrawer');
    animationController.forward();
  }

  void closeDrawer() {
    log('ManageCommentAnimation closeDrawer');
    animationController.reverse();
  }

  void dispose() {
    log('ManageCommentAnimation dispose');
    try {
      animationController.dispose();
    } catch (e) {
      // catch error as it fire in case custom drawer widget didn't called as happen in data screen
      log('ManageCommentAnimation dispose error $e');
    }
  }
}
