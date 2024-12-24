import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
  });
  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      // "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=600",
      /* placeholder: (context, url) => CircularProgressIndicator(
        color: AppColors.primary,
      ), */
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: 60.h,
          width: 60.0.w,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
      ),
    );
  }
}
