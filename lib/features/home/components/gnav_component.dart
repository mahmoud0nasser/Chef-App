import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/app_colors.dart';
import '../home_cubit/home_cubit.dart';

class GNavComponent extends StatelessWidget {
  const GNavComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      activeColor: AppColors.primary,
      tabBackgroundColor: AppColors.black12,
      padding: EdgeInsets.all(16.0),
      tabBorderRadius: 16.0,
      gap: 8.w,
      selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
      onTabChange: (value) {
        BlocProvider.of<HomeCubit>(context).changeIndex(value);
      },
      tabs: [
        GButton(
          icon: Icons.menu,
          text: 'Menu',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
    );
  }
}
