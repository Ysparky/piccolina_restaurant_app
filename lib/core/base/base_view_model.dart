import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/core/values/colors.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';

enum SnackBarType { primary, secondary, error }

class BaseViewModel extends ChangeNotifier {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading({bool newValue}) {
    _isLoading = newValue;
    if (hasListeners) {
      notifyListeners();
    }
  }

  void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.primary,
    Duration duration = const Duration(seconds: 2),
    String actionLabel = 'Ocultar',
    // void Function() onPressed,
  }) {
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case SnackBarType.primary:
        backgroundColor = BaseColors.primaryColor;
        textColor = BaseColors.whiteColor;
        break;
      case SnackBarType.secondary:
        backgroundColor = BaseColors.whiteColor;
        textColor = BaseColors.textColor;
        break;
      case SnackBarType.error:
        backgroundColor = BaseColors.dangerColor;
        textColor = BaseColors.whiteColor;
        break;
    }

    final context = scaffoldKey.currentContext;
    final snackBarAction = SnackBarAction(
      label: actionLabel,
      textColor: textColor,
      onPressed: () {},
      // onPressed: onPressed ??
      //     () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
    );
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyText2.copyWith(color: textColor),
      ),
      action: snackBarAction,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: duration,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(horizontal: wp(2), vertical: hp(2)),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
