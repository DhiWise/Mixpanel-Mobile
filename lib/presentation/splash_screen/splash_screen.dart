import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mixpanelapp/core/app_export.dart';
import 'package:mixpanelapp/presentation/splash_screen/controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.indigoA200,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          getPadding(top: 40, left: 40, right: 40, bottom: 20),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgVectorWhiteA700,
                        height: getVerticalSize(100.00),
                        width: getHorizontalSize(299.00),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
