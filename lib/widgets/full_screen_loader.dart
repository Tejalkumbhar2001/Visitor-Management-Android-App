import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants.dart';

Widget fullScreenLoader(
    {required bool loader,
    required Widget child,
    required BuildContext context}) {
  return Stack(
    children: [
      child,
      loader == true
          ? Container(
              height: getHeight(context),
              width: getWidth(context),
              color: Colors.white,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.blueAccent,
                  size: 75,
                ),
              ),
            )
          : Container(),
    ],
  );
}
