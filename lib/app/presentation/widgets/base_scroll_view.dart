import 'package:flutter/material.dart';

class BaseScrollView extends StatelessWidget {
  const BaseScrollView({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: child,
    );
  }
}
