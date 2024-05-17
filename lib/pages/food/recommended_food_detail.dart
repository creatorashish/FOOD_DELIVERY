import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.clear),
                  AppIcon(icon: Icons.shopping_cart_checkout)
                ]),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Remove this line
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Center(
                    child: BigText(
                      size: Dimensions.font26,
                      text: "Cerole Rice Dish Recipe",
                    ),
                  ),
                )

                // Container(
                //   color: Colors.white,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(Dimensions.radius20),
                //           topRight: Radius.circular(Dimensions.radius20))),
                //   width: double.maxFinite,
                //   padding: const EdgeInsets.only(top: 5, bottom: 10),
                //   child: Center(
                //       child: BigText(
                //           size: Dimensions.font26, text: "Chinese Side")),
                // ),
                ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: const ExpandableTextWidget(
                            text:
                                "Biryani is a fragrant and flavorful rice dish originating from South Asia, particularly India, Pakistan, and Bangladesh. Made with long-grain basmati rice, a blend of aromatic spices, and meat (often chicken, mutton, or beef), biryani offers a rich and complex taste experience. Regional variations like Hyderabadi, Lucknowi, and Kolkata biryani showcase diverse culinary traditions. The dish's hallmark is its unique cooking method—layering partially cooked rice and marinated meat, then slow-cooking it to perfection, allowing the flavors to meld. Biryani is a beloved centerpiece at celebrations and special occasions, cherished for its indulgent taste and cultural significance across the region.Biryani is a fragrant and flavorful rice dish originating from South Asia, particularly India, Pakistan, and Bangladesh. Made with long-grain basmati rice, a blend of aromatic spices, and meat (often chicken, mutton, or beef), biryani offers a rich and complex taste experience. Regional variations like Hyderabadi, Lucknowi, and Kolkata biryani showcase diverse culinary traditions. The dish's hallmark is its unique cooking method—layering partially cooked rice and marinated meat, then slow-cooking it to perfection, allowing the flavors to meld. Biryani is a beloved centerpiece at celebrations and special occasions, cherished for its indulgent taste and cultural significance across the region."),
                      )
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                bottom: Dimensions.height10,
                top: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove,
                  ),
                ),
                BigText(
                  text: "\$12.88 X 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                    child: const Padding(
                        padding: EdgeInsets.all(14),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        )),
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
        ],
      ),
    );
  }
}
