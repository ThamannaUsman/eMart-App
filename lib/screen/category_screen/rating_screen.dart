import 'package:ecommerce_app/const_final/color.dart';
import 'package:flutter/material.dart';


class RatingBarScreen extends StatelessWidget {
  final int rating;
  final double size;

  const RatingBarScreen({super.key, required this.rating, this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> starList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        starList.add(Icon(
          Icons.star,
          color: amberShade600,
          size: size,
        ));
      } else if (i == realNumber) {
        starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(
                Icons.star,
                color: amberShade600,
                size: size,
              ),
              ClipRect(
                clipper: Clipper(part: partNumber),
                child: Icon(
                  Icons.star,
                  color: whiteColor,
                  size: size,
                ),
              )
            ],
          ),
        ));
      } else {
        starList.add(Icon(
          Icons.star,
          color: whiteColor,
          size: size,
        ));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starList,
    );
  }
}

class Clipper extends CustomClipper<Rect>{
  final int part;
  Clipper({required this.part});


  Rect getClip(Size size) {
    return Rect.fromLTRB((size.width/10)*part, 0.0, size.width,size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;


}