import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lsv_ams/config/responsive.dart';

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
      height: double.infinity,
      padding: EdgeInsets.only(
        top: Platform.isLinux || Platform.isWindows ? kDefaultPadding : 0,
      ),
      color: kBgLightColor,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            children: <Widget>[
              Row(
                children: <Widget>[
                  const FlutterLogo(
                    size: 120,
                    style: FlutterLogoStyle.horizontal,
                    curve: Curves.bounceInOut,
                    duration: Duration(seconds: 5),
                    textColor: kTextColor,
                  ),
                  if (!Responsive.isDesktop(context)) ...const <Widget>[
                    Spacer(),
                    CloseButton()
                  ],
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  padding: const EdgeInsets.symmetric(
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
                iconSrc: LineIcons.otter,
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: 'Users',
                iconSrc: LineIcons.userAstronaut,
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: 'Deleted',
                iconSrc: LineIcons.trash,
                isActive: false,
                showBorder: false,
              ),

              const SizedBox(height: kDefaultPadding * 2),
              // Tags
              const Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
