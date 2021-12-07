import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';

class PresentationHeaderWidget extends StatelessWidget {
  const PresentationHeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = hp(34);
    final width = wp(100);
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          ClipPath(
            clipper: ShapeClipper([
              Offset(width / 5, height),
              Offset(width / 10 * 5, height - 60),
              Offset(width / 5 * 4, height + 20),
              Offset(width, height - 18)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffff3333).withOpacity(0.4),
                    const Color(0xffff3333).withOpacity(0.4),
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.topRight,
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ShapeClipper([
              Offset(width / 3, height + 20),
              Offset(width / 10 * 8, height - 60),
              Offset(width / 5 * 4, height - 60),
              Offset(width, height - 20)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffff3333).withOpacity(0.4),
                    const Color(0xffff3333).withOpacity(0.4),
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.topRight,
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ShapeClipper([
              Offset(width / 5, height),
              Offset(width / 2, height - 40),
              Offset(width / 5 * 4, height - 80),
              Offset(width, height - 20)
            ]),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffff3333),
                    const Color(0xffff3333).withOpacity(0.4),
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.topRight,
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              child: SvgPicture.asset(
                'assets/icons/logo-piccolina.svg',
                alignment: Alignment.topCenter,
                color: Colors.white,
                width: wp(80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  ShapeClipper(this._offsets);

  final List<Offset> _offsets;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 20)
      ..quadraticBezierTo(
        _offsets[0].dx,
        _offsets[0].dy,
        _offsets[1].dx,
        _offsets[1].dy,
      )
      ..quadraticBezierTo(
        _offsets[2].dx,
        _offsets[2].dy,
        _offsets[3].dx,
        _offsets[3].dy,
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
