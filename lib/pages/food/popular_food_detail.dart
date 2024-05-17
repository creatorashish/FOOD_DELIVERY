import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/icons_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite, //takes all the available width
              height: Dimensions.popularImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/images/food3.jpg")),
              ),
            ),
          ),
          //icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined)
                ],
              )),
//introduction of fodd page
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularImgSize -
                20, // to make the below container go up
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColumn(text: "Chinese Side"),
                    SizedBox(height: Dimensions.height10),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height10),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "Biryani is a fragrant and flavorful rice dish originating from South Asia, particularly India, Pakistan, and Bangladesh. Made with long-grain basmati rice, a blend of aromatic spices, and meat (often chicken, mutton, or beef), biryani offers a rich and complex taste experience. Regional variations like Hyderabadi, Lucknowi, and Kolkata biryani showcase diverse culinary traditions. The dish's hallmark is its unique cooking method—layering partially cooked rice and marinated meat, then slow-cooking it to perfection, allowing the flavors to meld. Biryani is a beloved centerpiece at celebrations and special occasions, cherished for its indulgent taste and cultural significance across the region."),
                      ),
                    )
                  ],
                )),
          ) // to positioned a widget
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width10 / 2,
            right: Dimensions.width10 / 2),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // padding: EdgeInsets.only(
                //   top: Dimensions.height20,
                //   bottom: Dimensions.height20,
                //   // left: Dimensions.width20,
                // ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.remove,
                          color: Colors.black26 //AppColors.signColor,
                          ),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: "0"),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      const Icon(Icons.add,
                          color: Colors.black26 //AppColors.signColor
                          ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: BigText(
                      text: "\$10 | Add to cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
