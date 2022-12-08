import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget ImageLoading({String? url, double? height, double? width, boxFit}) {
  return CachedNetworkImage(
    imageUrl: url!,
    height: height!,
    width: width,
    fit: boxFit,
    placeholder: (context, url) => Center(
      child: Image.asset(
        'assets/image/Frame 826.png',
        height: height * 0.50,
        width: height * 0.50,
      ),
    ),
    errorWidget: (context, url, error) => Center(
      child: Image.asset(
        'assets/image/Frame 826.png',
        height: height * 0.15,
        width: height * 0.15,
      ),
    ),
  );
}
