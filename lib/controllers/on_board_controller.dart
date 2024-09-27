import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/extensions.dart';
import 'package:spotify/core/route/routes.dart';

class OnBoardController {
  void navigateToChooseModePage(BuildContext context) {
    log("1");
    context.pushReplacementNamed(Routes.chooseModePage);
    log("Done");
  }
}
