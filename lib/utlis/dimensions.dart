import 'package:get/get.dart'; // to remove hardcore factors and screen looks same for all othe devices

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeight / 2.17;

  static double pageViewContainer =
      screenHeight / 3.15; //screen height/image_conatiner_height//
  static double pageViewTextContainer =
      screenHeight / 5.79; //screen height/text image conatiner

  // to take height dynamically for padding and Margin

  static double height10 = screenHeight /
      69.51; //to dynamically give spacing between widgets of textbox//
  static double height20 = screenHeight / 34.75;
  static double height15 = screenHeight / 46.34;
  static double height45 = screenHeight / 15.44;
  static double height30 = screenHeight / 23.17;
  // to take width Dynamically for padding and Margin
  static double width10 = screenHeight /
      69.51; //to dynamically give spacing between widgets of textbox//
  static double width20 = screenHeight / 34.75;
  static double width15 = screenHeight / 46.34;
  static double width30 = screenHeight / 23.17;
  static double width40 = screenHeight / 86.44;
//font
  static double font16 = screenHeight / 43.44;
  static double font20 = screenHeight / 34.75;
  static double font26 = screenHeight / 26.73;
  // borderradius
  static double radius15 = screenHeight / 46.34;
  static double radius20 = screenHeight / 34.75;
  static double radius30 = screenHeight / 23.17;

  //icon

  static double iconSize24 = screenHeight / 28.96;
  static double iconSize16 = screenHeight / 43.43;

  static double listViewImgSize = screenWidth / 2.66; //list view size
  static double listViewTextContSize = screenWidth / 3.2;
  static double popularImgSize = screenHeight / 1.98;
  //bottom height
  static double bottomHeightBar = screenHeight / 5.79;
}
