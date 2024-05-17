import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icons_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override // to dispose value of cuurpagevalue
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //slider section
          SizedBox(
            // color: Colors.red,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position); //function
                }),
          ),
          // dots indicator
          // ignore: unnecessary_new
          new DotsIndicator(
            dotsCount: 5,
            position: _currPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor, // change color of dot indicator
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          //popular text
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
            margin: EdgeInsets.only(left: Dimensions.width20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular"),
                SizedBox(
                  width: Dimensions.width10,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing"),
                ),
                // list of foods and images
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            primary: false,
            itemBuilder: ((context, index) {
              return Container(
                  // color: Colors.red,
                  child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/food1.jpeg"))),
                    ),
                    //text container
                    Expanded(
                      // helps container to take all the available space
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        //width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              Dimensions.radius20,
                            ),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Nutritious Fruit meal in china"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(text: "with chinese characteristics"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),

                              // SizedBox(height: Dimensions.height20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconsAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1),
                                  IconsAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: AppColors.mainColor),
                                  IconsAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: AppColors.iconColor2)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity(); // used for scaling of widgets
    if (index == _currPageValue) {
      // for 1st slide
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      // for next slide
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1); //till here
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      // for previous slide
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0); //till here
    } else {
      //   //not working properly
      //   //   //thirdslide
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      // to show effect
      transform: matrix,
      child: Stack(
        // to use two widgets on one another
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food1.jpeg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //name of resturant container
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                  bottom: Dimensions.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(5, 5),
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,
                          0)), //remove shadow from left and right part of widget
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.width15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: const AppColumn(
                  text: "Chinese Side",
                ), // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     BigText(text: "Chinese side"),
                //     SizedBox(
                //       height: Dimensions.height10,
                //     ),
                //     Row(
                //       children: [
                //         Wrap(
                //           //to draw stars
                //           children: List.generate(
                //             5,
                //             (index) => const Icon(Icons.star,
                //                 color: AppColors.mainColor, size: 15),
                //           ),
                //         ),
                //         const SizedBox(width: 5),
                //         SmallText(text: "4.5"),
                //         const SizedBox(width: 5),
                //         SmallText(text: "3576"),
                //         const SizedBox(width: 6),
                //         SmallText(text: "comments"),
                //       ],
                //     ),
                //     SizedBox(height: Dimensions.height20),
                //     const Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         IconsAndTextWidget(
                //             icon: Icons.circle_sharp,
                //             text: "Normal",
                //             iconColor: AppColors.iconColor1),
                //         IconsAndTextWidget(
                //             icon: Icons.location_on,
                //             text: "1.7km",
                //             iconColor: AppColors.mainColor),
                //         IconsAndTextWidget(
                //             icon: Icons.access_time_rounded,
                //             text: "32min",
                //             iconColor: AppColors.iconColor2)
                //       ],
                //     )
                //   ],
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
