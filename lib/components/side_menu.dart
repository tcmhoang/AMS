import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../config/constansts.dart';
import '../config/extensions.dart';
import 'side_menu_item.dart';
import 'tags.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      color: kBgLightColor,
      child: Column(
        children: <Widget>[
          const FlutterLogo(
            size: 120,
            style: FlutterLogoStyle.horizontal,
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 5),
            textColor: kTextColor,
          ),
          const SizedBox(height: kDefaultPadding),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.5,
                vertical: kDefaultPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: kPrimaryColor,
            ),
            onPressed: () {},
            icon: LineIcon.edit(size: 16),
            label: const Text(
              'Add asset',
              style: TextStyle(color: Colors.white),
            ),
          ).addNeumorphism(
            topShadowColor: Colors.white,
            bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
          ),
          const SizedBox(height: kDefaultPadding),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.5,
                vertical: kDefaultPadding,
              ),
              primary: kBgDarkColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(double.infinity, 40),
              onPrimary: kPrimaryColor,
            ),
            onPressed: () {},
            icon: LineIcon.user(
              size: 16,
              color: kTextColor,
            ),
            label: const Text(
              'Add user',
              style: TextStyle(color: kTextColor),
            ),
          ).addNeumorphism(),
          const SizedBox(height: kDefaultPadding * 2),
          // Menu Items
          SideMenuItem(
            press: () {},
            title: 'Assets',
            iconSrc: LineIcon.otter().icon!,
            isActive: true,
            itemCount: 3,
          ),
          SideMenuItem(
            press: () {},
            title: 'Users',
            iconSrc: LineIcon.userAstronaut().icon!,
            isActive: false,
          ),
          SideMenuItem(
            press: () {},
            title: 'Asset Categories',
            iconSrc: LineIcon.file().icon!,
            isActive: false,
          ),
          SideMenuItem(
            press: () {},
            title: 'Deleted',
            iconSrc: LineIcon.trash().icon!,
            isActive: false,
            showBorder: false,
          ),

          const SizedBox(height: kDefaultPadding * 2),
          // Tags
          const Tags(),
        ],
      ),
    );
  }
}
