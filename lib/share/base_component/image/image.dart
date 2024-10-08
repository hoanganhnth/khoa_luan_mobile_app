import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget imageFromNetWork(
    {required String url,
    required double? width,
    required double? height,
    bool? fill,
    BoxFit? fit,
    Widget? placeholder,
    Color? color}) {
  return url.contains(".svg")
      ? SvgPicture.network(
          url,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: color,
        )
      : CachedNetworkImage(
          imageUrl: url,
          width: width,
          fit: fit ?? (fill == true ? BoxFit.fill : BoxFit.contain),
          height: height,
          placeholder: (context, url) => const Center(
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ))),
          errorWidget: (context, url, error) =>
              placeholder ?? const Icon(Icons.error),
        );
}

Widget imageFromLocale({
  required String url,
  double? width,
  double? height,
  Color? color,
  BoxFit? fit,
  bool? gaplessPlayback,
  Animation<double>? opacity,
}) {
  return url.contains(".svg")
      ? SvgPicture.asset(
          url,
          width: width,
          // color: color,
          height: height,
          fit: fit ?? BoxFit.contain,
        )
      : Image.asset(
          url,
          width: width,
          color: color,
          height: height,
          fit: fit ?? BoxFit.contain,
          opacity: opacity,
          gaplessPlayback: gaplessPlayback ?? false,
        );
}
