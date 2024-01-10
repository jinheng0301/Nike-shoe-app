import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nike/utils/constants.dart';
import 'package:nike/view/home/home_view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeView(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    // _pageController.jumpToPage(selectedIndex);

    // this method change the screens using some smooth animations
    _pageController.animateToPage(
      selectedIndex,
      curve: Curves.easeInCubic,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        iconSize: 27,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.shopping_cart,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
            ),
          ),
        ],
      ),
    );
  }
}
