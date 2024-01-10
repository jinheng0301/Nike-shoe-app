import 'package:flutter/material.dart';
import 'package:nike/data/dummy_data.dart';
import 'package:nike/utils/constants.dart';
import 'package:nike/view/home/components/home_appbar.dart';

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
                SizedBox(height: size.height * 0.04),
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
                      width: double.infinity,
                      height: size.height * 0.3,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container();
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
