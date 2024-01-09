import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/utils/constants.dart';
import 'package:nike/view/home/components/home_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: HomeAppBar(),
      ),
    );
  }
}

