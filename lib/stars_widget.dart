import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(int rating);

class StarsScreen extends StatefulWidget {
  const StarsScreen({super.key});

  @override
  State<StarsScreen> createState() => _StarsScreenState();
}

class _StarsScreenState extends State<StarsScreen> {
  var rating = 5;

  @override
  Widget build(BuildContext context) {
    return StarRating(
      rating: rating,
      onRatingChanged: (rating) => setState(() => this.rating = rating),
    );
  }
}

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = 0,
    this.onRatingChanged,
    this.color,
  });

  final int starCount;
  final int rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme
            .of(context)
            .primaryColor,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}
