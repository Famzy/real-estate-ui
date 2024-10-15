import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapCircleWidget extends StatelessWidget {
  const MapCircleWidget(
      {super.key,
      this.transformScale = 0.4,
        this.itemHeight = 60,
        this.itemWidth=60,
      this.itemColor,
        this.assetColor,
      required this.asset});
  final String asset;
  final double transformScale;
  final double itemHeight;
  final double itemWidth;
  final Color? itemColor;
  final Color? assetColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight.h,
      width: itemWidth.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: itemColor ?? Colors.grey.withOpacity(0.5)),
      child: Transform.scale(
        scale: transformScale,
        child: SvgPicture.asset(asset, color: assetColor,),
      ),
    );
  }
}
