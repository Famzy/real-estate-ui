import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:realestate/core/themes/color_constants.dart';
import 'package:realestate/core/utils/image_constants.dart';
import 'package:realestate/features/home/presentation/widgets/home_card_widget.dart';
import 'package:realestate/features/search/presentation/widgets/animation/animated_counter.dart';
import 'package:realestate/features/search/presentation/widgets/animation/fade_in_expanded.dart';
import 'package:realestate/features/search/presentation/widgets/animation/fly_in_fade_in.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  @override
  void dispose() {
    // Remove the observer when the widget is disposed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorConstants().primaryColor,
              ColorConstants().secondaryColor.withOpacity(0.3),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [
              0.4,
              0.7,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(kTextTabBarHeight + 25.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInExpandWidget(
                        child: Container(
                          height: 41.h,
                          width: 170.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: SvgPicture.asset(
                                  AllImages().locationIcon,
                                  color: ColorConstants().secondaryColor,
                                ),
                              ),
                              Gap(5.w),
                              Text(
                                "Saint Petersburg",
                                style: TextStyle(fontSize: 14.sp, color: ColorConstants().secondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(5.w),
                      FadeInExpandWidget(
                        child: CircleAvatar(
                          backgroundColor: ColorConstants().primaryColor,
                          child: const Center(
                            child: Icon(Icons.person),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(40),
                  FlyInFadeIn(
                    child: Text(
                      "Hi, Marina",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: ColorConstants().secondaryColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Gap(10.h),
                  FlyInFadeIn(
                    child: Text(
                      "let's select your \nperfect place",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 29),
                    ),
                  ),
                  Gap(30.h),
                  Row(
                    children: [
                      FadeInExpandWidget(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          height: 139.h,
                          width: 139.w,
                          decoration: BoxDecoration(color: ColorConstants().primaryColor, shape: BoxShape.circle),
                          child: Column(
                            children: [
                              Text(
                                "BUY",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                              ),
                              Gap(10.h),
                              const AnimatedCounter(
                                start: 0,
                                end: 1034,
                                duration: Duration(milliseconds: 1400),
                                color: Colors.white,
                                curve: Curves.easeInOut,
                              ),
                              Text(
                                "offers",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(10.h),
                      FadeInExpandWidget(
                        child: Container(
                          height: 139.h,
                          width: 187.w,
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: ColorConstants().stoneWhite, borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Text(
                                "RENT",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: ColorConstants().secondaryColor),
                              ),
                              Gap(10.h),
                              AnimatedCounter(
                                start: 0,
                                end: 2212,
                                duration: const Duration(milliseconds: 1400),
                                color: ColorConstants().secondaryColor,
                                curve: Curves.easeInOut,
                              ),
                              Text(
                                "offers",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: ColorConstants().secondaryColor),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Gap(40.h),
            FlyInFadeIn(
              duration: const Duration(seconds: 1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    HomeCardWidget(
                      height: 179,
                      width: double.infinity,
                      image: AllImages().kitchenImage,
                      title: "Gladkova St., 25",
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        HomeCardWidget(
                          height: 368,
                          width: 175,
                          image: AllImages().bathRoomImage,
                           title: "Trefoleva St., 43",
                        ),
                        Gap(10.w),
                        Column(
                          children: [
                            HomeCardWidget(

                              image: AllImages().kitchenImage,
                               title: "Sedolva., 11",
                              width: 170,
                            ),
                            Gap(10.h),
                            HomeCardWidget(
                              image: AllImages().bathRoomImage,
                               title: "Gabinna St., 22",
                              width: 173,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                // height: 500.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
