import 'dart:ui' as ui;

double devicePixelRatio = ui.window.devicePixelRatio;
ui.Size size = ui.window.physicalSize;
double width = size.width;
double height = size.height;
double screenWidth = width / devicePixelRatio;
double screenHeight = height / devicePixelRatio;
ui.Size screenSize = ui.Size(screenWidth, screenHeight);

double wp(percentage) {
  // print('Width from $percentage: ${percentage / 100 * screenWidth}');
  return percentage / 100 * screenWidth;
}

double hp(percentage) {
  // print('Height from $percentage: ${percentage / 100 * screenHeight}');
  // print(44 * 100 / screenHeight);
  return percentage / 100 * screenHeight;
}
