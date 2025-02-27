import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'app_colors.dart';

void navigate({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}

void navigateReplacement({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(
    context,
    route,
    arguments: arg,
  );
}

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: getState(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates {
  error,
  success,
  warning,
}

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.green;
    case ToastStates.warning:
      return AppColors.primary;
  }
}

Future<XFile?> pickImage(
  ImageSource source,
) async {
  XFile? image = await ImagePicker().pickImage(
    source: source,
  );
  if (image != null) {
    return image;
  } else {
    return null;
  }
}

Future uploadImageToApi(XFile image) async {
  return MultipartFile.fromFile(
    image.path,
    filename: image.path.split('/').last,
  );
}
