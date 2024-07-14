import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/core/constants/app_colors.dart';
import 'package:untitled1/core/constants/dimensions.dart';
import 'package:untitled1/core/shared/custom_title.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled1/features/home/logic/home_controller.dart';

import '../../data/models/offer_model.dart';
import '../widgets/clip_path.dart';
class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> imageUrls = [
    'assets/images/i2.png',
    'assets/images/i3.png',
    'assets/images/i4.png',
    'assets/images/image.png',
  ];
  final List<String> offersImages = [
    'assets/images/i2.png',
    'assets/images/image.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:  BottomAppBar(
      height: Dimensions.screenHeight * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.person_outline,size: Dimensions.screenHeight * 0.03,),
                Icon(Icons.favorite_border_rounded,size: Dimensions.screenHeight * 0.03),
                Icon(Icons.home_outlined,color: AppColors.kTextColorOrange,size: Dimensions.screenHeight * 0.05),
                Icon(Icons.credit_card,size: Dimensions.screenHeight * 0.03),
                Icon(Icons.search,size: Dimensions.screenHeight * 0.03),
              ],
            ),

    ),
            appBar: PreferredSize(
                preferredSize:
                    const Size.fromHeight(149.53), // Set preferred height
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, bottom: 1, top: 15),
                    width: 428.0, // Set width
                    height: 149.53, // Set height
                    color: Colors.blue.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/profile.jpg"),
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.03,
                            ),
                            const CustomTitle(
                              text: "Hi lama",
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications_none_rounded,color: Colors.white)),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.02,
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.menu,color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                )), // ,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTitle(
                        text: "Best offers",
                      fontWeight:   FontWeight.w700,fontSize: 25,
                      ),
                      CustomTitle(
                        text: "See more",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kTextColorOrange,
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.screenHeight * 0.01,),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.25,
                    child: Column(
                      children: [
                        GetBuilder<HomeController>(builder: (controller){
                        return  Expanded(
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: controller.offers.length,
                              itemBuilder: (context, index) {
                                return buildImageSlider(
                                    offersImages[index],controller.offers[index]);
                              },
                            ),
                          );
                        }),

                        SizedBox(height: 16.0),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: offersImages.length,
                          effect: const ExpandingDotsEffect(
                            // Set the effect to Worm (expanded dots)
                            dotWidth: 16.0,
                            dotHeight: 16.0,
                            spacing: 8.0,
                            dotColor: Colors.grey,
                            activeDotColor: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                  const CustomTitle(text: "Recommended",fontWeight: FontWeight.w700,fontSize: 25,),

                  SizedBox(height: Dimensions.screenHeight * 0.01,),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.25,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Container(
                            width: Dimensions.screenWidth * 0.8,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.08),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: AppColors.kSecondColorGrey2
                                          .withOpacity(0.1))
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                        ),
                                        SizedBox(
                                          width: Dimensions.screenWidth * 0.01,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTitle(
                                              text: "Name",
                                              fontSize: 14,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 15,
                                                ),
                                                CustomTitle(
                                                  text: "location",
                                                  fontSize: 14,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    CustomTitle(
                                      text: "Skin care",
                                      fontSize: 14,
                                      color: AppColors.kTextColorOrange,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.screenHeight * 0.02,
                                ),
                                Container(
                                  width: Dimensions.screenWidth * 0.8,
                                  height: Dimensions.screenHeight * 0.13,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              imageUrls[index]),
                                          fit: BoxFit.cover)),
                                ),
                                // SizedBox(
                                //   height: Dimensions.screenHeight * 0.013,
                                // ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.favorite_border_rounded),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTitle(
                                            text: "2,244 Likes",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star_outline_rounded),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTitle(
                                            text: "4.5 (38 Review)",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                                     ],
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.screenHeight * 0.01,),
                  const CustomTitle(text: "Cosmetic clinics ",fontWeight: FontWeight.w700,fontSize: 25,),

                  SizedBox(height: Dimensions.screenHeight * 0.01,),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.25,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {

                        return Container(
                            width: Dimensions.screenWidth * 0.8,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.08),
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: AppColors.kSecondColorGrey2
                                          .withOpacity(0.1))
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 20,
                                        ),
                                        SizedBox(
                                          width: Dimensions.screenWidth * 0.01,
                                        ),
                                        const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            CustomTitle(
                                              text: "Name",
                                              fontSize: 14,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 15,
                                                ),
                                                CustomTitle(
                                                  text: "location",
                                                  fontSize: 14,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    CustomTitle(
                                      text: "Skin care",
                                      fontSize: 14,
                                      color: AppColors.kTextColorOrange,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.screenHeight * 0.02,
                                ),

                          Expanded(
                            child: MasonryGridView.count(
                              crossAxisCount: 2,

                              mainAxisSpacing: 2,
                              crossAxisSpacing: 0,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return
                                Container(
                                  width: Dimensions.screenWidth * 0.8,
                                  height: Dimensions.screenHeight * 0.13,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              imageUrls[index]),
                                          fit: BoxFit.cover)),
                                );
                              },
                            ),
                          ),
                                const Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.favorite_border_rounded),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTitle(
                                            text: "2,244 Likes",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star_outline_rounded),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTitle(
                                            text: "4.5 (38 Review)",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));

                      },
                    ),
                  ),

                  SizedBox(height: Dimensions.screenHeight * 0.01,),
                  CustomTitle(text: "Salon ",fontWeight: FontWeight.w700,fontSize: 25,),

                  SizedBox(height: Dimensions.screenHeight * 0.01,),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.25,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Container(
                            width: Dimensions.screenWidth * 0.8,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)),
                                 border: Border.all(width: 0.08),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: AppColors.kSecondColorGrey2
                                          .withOpacity(0.2))
                                ]),
                            child: Column(
                              children: [

                                Container(
                                  width: Dimensions.screenWidth * 0.8,
                                  height: Dimensions.screenHeight * 0.13,
                                  padding: EdgeInsets.only(left: 15, bottom: 10,),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/image.png"),
                                          fit: BoxFit.cover),

                                  ),
                                child:    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomTitle(
                                      text: "Place name ",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined,color: Colors.white,),
                                        CustomTitle(
                                          text:
                                          "Damascus",
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ) ,
                                ),

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.favorite_border_rounded),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTitle(
                                            text: "2,244 Likes",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star_outline_rounded),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTitle(
                                            text: "4.5 (38 Review)",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget buildImageSlider(imageUrl,OfferModel offerModel) => Container(
        padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
        width: Dimensions.screenWidth * 0.2,
        height: Dimensions.screenHeight * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(
                  text: offerModel.title,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                CustomTitle(
                  text:
                      offerModel.description,
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Set the button's background color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Set button border radius
                  ),
                ),
                onPressed: () {},
                child: CustomTitle(
                  text: "Details",
                  color: AppColors.kTextColorOrange,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      );

  Widget buildLeftImage(String imageUrl) =>
 Container(
    width: Dimensions.screenWidth * 0.8,
    padding: EdgeInsets.only(
        left: 10, right: 10, top: 10, bottom: 10),
    decoration: BoxDecoration(
        border: Border.all(width: 0.08),
        borderRadius:
        BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
              color: AppColors.kSecondColorGrey2
                  .withOpacity(0.1))
        ]),
    child: Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                ),
                SizedBox(
                  width: Dimensions.screenWidth * 0.01,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    CustomTitle(
                      text: "Name",
                      fontSize: 14,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 15,
                        ),
                        CustomTitle(
                          text: "location",
                          fontSize: 14,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            CustomTitle(
              text: "Skin care",
              fontSize: 14,
              color: AppColors.kTextColorOrange,
            )
          ],
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.02,
        ),
        Container(
          width: Dimensions.screenWidth * 0.8,
          height: Dimensions.screenHeight * 0.13,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/image.png"),
                  fit: BoxFit.cover)),
        ),
        // SizedBox(
        //   height: Dimensions.screenHeight * 0.013,
        // ),
        Expanded(
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  CustomTitle(
                    text: "2,244 Likes",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star_outline_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  CustomTitle(
                    text: "4.5 (38 Review)",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
}
