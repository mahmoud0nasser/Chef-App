import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    super.key,
    required this.cameraOnTap,
    required this.galleryOnTap,
  });
  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Camera
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.camera.tr(context),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
            onTap: cameraOnTap,
          ),
          // Gallery
          ListTile(
            leading: Icon(
              Icons.photo,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.gallery.tr(context),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
            onTap: galleryOnTap,
          ),
        ],
      ),
    );
  }
}
