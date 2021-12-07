import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/values/colors.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

enum LoadingType { wave, pulse }

class BaseLoadingOverlay<T extends BaseViewModel> extends StatelessWidget {
  const BaseLoadingOverlay({
    Key key,
    @required this.child,
    this.loadingType = LoadingType.wave,
    this.color = BaseColors.primaryColor,
    this.size,
  }) : super(key: key);

  final Widget child;
  final LoadingType loadingType;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        _buildLoadingIndicator(context),
      ],
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    final baseTitiViewModel = Provider.of<T>(context);
    final isLoading = baseTitiViewModel.isLoading;
    if (isLoading) {
      return Container(
        height: hp(100),
        width: wp(100),
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: _buildSpinKit(),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildSpinKit() {
    return loadingType == LoadingType.pulse
        ? SpinKitPulse(
            color: color,
            size: size ?? wp(15),
          )
        : SpinKitWave(
            color: color,
            size: size ?? wp(15),
          );
  }
}
