
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';


class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = ColorConstants.white,
    this.margin,
  });

  final double width, height, radius, padding;
  final EdgeInsets? margin;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
    );
  }
}
