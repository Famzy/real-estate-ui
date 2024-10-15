import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:realestate/core/themes/color_constants.dart';
import 'package:realestate/core/utils/image_constants.dart';
import 'package:realestate/features/search/presentation/widgets/animation/fade_in_expanded.dart';
import 'package:realestate/features/search/presentation/widgets/maps_circle_widget.dart';

class MapFabAction extends StatefulWidget {
  const MapFabAction({super.key});

  @override
  State<MapFabAction> createState() => _MapFabActionState();
}

class _MapFabActionState extends State<MapFabAction> {
  bool _tipVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 120.h, left: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: _tipVisible,
              child: InkWell(
            onTap: () {
              setState(() {
                _tipVisible = !_tipVisible;
              });
            },
            child: FadeInExpandWidget(
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffFBF5EB)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _innerRows(asset: AllImages().walletIcon, title: "Cosy areas",),
                    _innerRows(asset: AllImages().walletIcon, title: "Price", isSelected: true),
                    _innerRows(asset: AllImages().walletIcon, title: "Infrastructure", isSelected: true),
                    _innerRows(asset: AllImages().walletIcon, title: "Without any layer", isSelected: true),
                  ],
                ),
              ),
            ),
          )),
          Visibility(
            visible:!_tipVisible,
            child: InkWell(
                onTap: () {
                  setState(() {
                    _tipVisible = !_tipVisible;
                  });
                },
                child:  FadeInExpandWidget(
                        child: MapCircleWidget(
                          asset: AllImages().stackIcon,
                        ),
                      )),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FadeInExpandWidget(
                child: MapCircleWidget(
                  asset: AllImages().navigationIcon,
                ),
              ),
              FadeInExpandWidget(
                  child: Container(
                height: 51.h,
                width: 180.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1,
                      child: SvgPicture.asset(AllImages().menuIcon),
                    ),
                    Gap(5.w),
                    Text(
                      "List of variants",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _innerRows(
          {required title, required asset, bool isSelected = false}) =>
      Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(asset),
              Gap(10.w),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isSelected ? ColorConstants().primaryColor : null),
              )
            ],
          ),
          Gap(15.h),
        ],
      );
}
