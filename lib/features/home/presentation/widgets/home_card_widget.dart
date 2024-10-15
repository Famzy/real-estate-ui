import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCardWidget extends StatefulWidget {
  const HomeCardWidget({super.key, this.width = 160, this.height = 179, this.image, this.title = ''});
  final double height;
  final double width;
  final String? image;
  final String? title;

  @override
  State<HomeCardWidget> createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  double _containerWidth = 70;
  @override
  void initState() {
    super.initState();
   Future.delayed(const Duration(seconds: 3), () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            // Animate to the full width of the screen
            _containerWidth = MediaQuery.of(context).size.width;
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height.h,
        width: widget.width.h,
        decoration: BoxDecoration(
            color: Colors.orange,
            image: widget.image != null ? DecorationImage(image: AssetImage(widget.image!), fit: BoxFit.cover) : null,
            borderRadius: BorderRadius.circular(30)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  width: _containerWidth,
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.8), borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 28,
                      ),
                      Flexible(
                         child:


                        Text(
                          widget.title ?? '',
                          style: TextStyle(fontSize: 14.sp, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Material(
                              elevation: 6,
                              shadowColor: Colors.black54,
                              borderRadius: BorderRadius.circular(100.0), //
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white),
                                child: const Align(alignment: Alignment.center, child: Icon(Icons.chevron_right)),
                              ),
                            )),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}

///
