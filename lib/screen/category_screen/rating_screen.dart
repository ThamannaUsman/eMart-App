import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class RatingScreen extends StatelessWidget {
//   final String value;
//
//   const RatingScreen({super.key, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar.builder(
//       itemBuilder: (context, index) {
//         return Icon(
//           Icons.star,
//           color: Colors.amber.shade600,
//         );
//       },
//       onRatingUpdate: (value) {},
//       itemCount: 5,
//       itemSize: 25,
//       maxRating: 5,
//     );
//   }
// }

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
          color: Colors.amber.shade600,
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
                color: Colors.amber.shade600,
                size: size,
              ),
              ClipRect(
                clipper: Clipper(part: partNumber),
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                  size: size,
                ),
              )
            ],
          ),
        ));
      } else {
        starList.add(Icon(
          Icons.star,
          color: Colors.white,
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