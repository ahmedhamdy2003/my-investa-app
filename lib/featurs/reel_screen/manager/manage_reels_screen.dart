import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:investa4/core/apis/get_reels.dart';

class ManageReelsScreen {
  late AnimationController animationController;
  late Animation<Offset> animation;
  List<Reel> reels = [];

  Future<void> init() async {
    // await Future.delayed(const Duration(milliseconds: 6000));
    reels = await getReels() ?? [];
  }

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
