import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:realestate/core/utils/image_constants.dart';
import 'package:realestate/features/search/presentation/widgets/animation/fade_in_expanded.dart';
import 'package:realestate/features/search/presentation/widgets/maps_circle_widget.dart';

class MapFabAction extends StatelessWidget {
  const MapFabAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 120.h, left: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FadeInExpandWidget(
                child: MapCircleWidget(
                  asset: AllImages().stackIcon,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              FadeInExpandWidget(
                child: MapCircleWidget(
                  asset: AllImages().navigationIcon,
                ),
              )
            ],
          ),
          FadeInExpandWidget(
              child: Container(
                height: 51.h,
                width: 180.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
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
    );
  }
}
