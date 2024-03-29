import 'package:flutter/material.dart';
import 'package:nike/animation/fade_animation.dart';
import 'package:nike/data/dummy_data.dart';
import 'package:nike/models/shoe_model.dart';
import 'package:nike/theme/custom_app_theme.dart';
import 'package:nike/utils/constants.dart';
import 'package:nike/view/home/components/home_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexCategory = 0;
  int selectedIndexOfFeatured = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: HomeAppBar(),
        body: Column(
          children: [
            Column(
              children: [
                _categoryView(size),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                      ),
                      width: size.width / 16,
                      height: size.height / 2.4,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: featured.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndexOfFeatured = index;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.04,
                                ),
                                child: Text(
                                  featured[index],
                                  style: TextStyle(
                                    fontSize: selectedIndexOfFeatured == index
                                        ? 21
                                        : 18,
                                    color: selectedIndexOfFeatured == index
                                        ? AppConstantsColor.darkTextColor
                                        : AppConstantsColor.unSelectedTextColor,
                                    fontWeight: selectedIndexOfFeatured == index
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.89,
                      height: size.height * 0.4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: availableShoes.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          ShoeModel model = availableShoes[index];
                          return GestureDetector(
                            onTap: () {
                              // navigate to the details screen later on by tapping on these items
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                                horizontal: size.width * 0.005,
                              ),
                              width: size.width / 1.5,
                              child: Stack(
                                children: [
                                  Container(
                                    width: size.width / 1.81,
                                    decoration: BoxDecoration(
                                      color: model.modelColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    child: FadeAnimation(
                                      delay: 1,
                                      child: Row(
                                        children: [
                                          Text(
                                            model.name,
                                            style: AppTheme.homeProductName,
                                          ),
                                          SizedBox(
                                            width: 120,
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 10,
                                    child: FadeAnimation(
                                      delay: 1.5,
                                      child: Text(
                                        model.model,
                                        style: AppTheme.homeProductModel,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 80,
                                    left: 10,
                                    child: FadeAnimation(
                                      delay: 2,
                                      child: Text(
                                        '${model.price.toStringAsFixed(2)}',
                                        style: AppTheme.homeProductPrice,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 50,
                                    child: FadeAnimation(
                                      delay: 2,
                                      child: Hero(
                                        tag: model.imgAddress,
                                        child: RotationTransition(
                                          turns: AlwaysStoppedAnimation(
                                            -30 / 360,
                                          ),
                                          child: SizedBox(
                                            width: 250,
                                            height: 230,
                                            child: Image(
                                              image: AssetImage(
                                                model.imgAddress,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 70,
                                    left: 170,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(
                                        FontAwesomeIcons.circleArrowRight,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: selectedIndexCategory == index ? 21 : 18,
                      color: selectedIndexCategory == index
                          ? AppConstantsColor.darkTextColor
                          : AppConstantsColor.unSelectedTextColor,
                      fontWeight: selectedIndexCategory == index
                          ? FontWeight.bold
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
