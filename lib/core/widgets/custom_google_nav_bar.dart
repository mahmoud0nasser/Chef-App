import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/app_colors.dart';

class CustomGoogleNavWidget extends StatelessWidget {
  const CustomGoogleNavWidget({
    super.key,
    required this.currentIndex,
    this.onChanged,
    required this.tabs,
  });
  final int currentIndex;
  final Function(int)? onChanged;
  final List<GButton> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      child: GNav(
        activeColor: AppColors.primary,
        tabBackgroundColor: AppColors.black12,
        padding: EdgeInsets.all(16.0),
        tabBorderRadius: 16.0,
        gap: 8.w,
        selectedIndex: currentIndex,
        onTabChange: onChanged,
        tabs: tabs,
      ),
    );
  }
}
