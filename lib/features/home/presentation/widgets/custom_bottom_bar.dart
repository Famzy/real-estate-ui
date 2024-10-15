import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/core/themes/color_constants.dart';
import 'package:realestate/core/utils/image_constants.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar(
      {super.key,
      this.onChanged,
      required this.onDestinationSelected,
      required this.selectedIndex});

  Function(BottomBarEnum)? onChanged;
  int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: AllImages().searchIcon,
      type: BottomBarEnum.search,
    ),
    BottomMenuModel(
      icon: AllImages().chatIcon,
      type: BottomBarEnum.chat,
    ),
    BottomMenuModel(
      icon: AllImages().homeIcon,
      type: BottomBarEnum.home,
    ),
    BottomMenuModel(
      icon: AllImages().favoritesIcon,
      type: BottomBarEnum.favourite,
    ),
    BottomMenuModel(
      icon: AllImages().profileIcon,
      type: BottomBarEnum.profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
        decoration: BoxDecoration(
            color: const Color(0xff2B2B2B),
            borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...bottomMenuList.map(
              (item) => InkWell(
                onTap: () {
                  selectedIndex = item.type.index;
                  onDestinationSelected(item.type.index);
                },
                child: AnimatedContainer(
                    height: item.type.index == selectedIndex ? 55.h : 45.h,
                    width: item.type.index == selectedIndex ? 55.w : 45.w,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: item.type.index == selectedIndex
                            ? ColorConstants().primaryColor
                            : const Color(0xff222120),
                        shape: BoxShape.circle),
                    duration: const Duration(milliseconds: 500),
                    child: Transform.scale(
                      scale: item.type.index == selectedIndex ? 0.5 : 0.7,
                      child: SvgPicture.asset(
                        item.icon,
                        height: 12.h,
                        color: Colors.white,
                      ),
                    )),
              ),
            )
          ],
        ));
  }
}

enum BottomBarEnum {
  search,
  chat,
  home,
  favourite,
  profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.type,
  });

  String icon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
