import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/theme/custom_app_theme.dart';
import 'package:nike/utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  // In Dart, the implements keyword is used to declare that a class is going to provide the behavior defined by an interface.
  // In this case, PreferredSizeWidget is an interface, and when a class implements it,
  // it promises to provide the required methods and properties defined by that interface.

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'Discover',
          style: AppTheme.homeAppBar,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.search,
            size: 25,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.bell,
            size: 25,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}
