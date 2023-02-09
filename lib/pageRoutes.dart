import 'package:assessment/createProfile.dart';
import 'package:assessment/jobCity.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routing {
  static Route routing(RouteSettings settings) {
    switch (settings.name) {
      case '/jobCity':
        return PageTransition(
            child: JobCity(), type: PageTransitionType.rightToLeftWithFade);
      default:
        return PageTransition(
            child: const CreateProfile(),
            type: PageTransitionType.rightToLeftWithFade);
    }
  }
}
