import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final double score; // Puntuación de 1 a 10

  const RatingStar({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    // Asegúrate de que la puntuación esté entre 0 y 10
    double clampedScore = score.clamp(0, 10);
    double percentageFilled = clampedScore / 10; // Proporción de la estrella que debe ser pintada

    return Stack(
      children: [
        Icon(
          Icons.star_border,
          color: Colors.yellow.shade700,
        ),
        ClipRect(
          clipper: _RatingStarClipper(percentageFilled),
          child: Icon(
            Icons.star,
            color: Colors.yellow.shade700, // Color de la estrella pintada
          ),
        ),
      ],
    );
  }
}

class _RatingStarClipper extends CustomClipper<Rect> {
  final double percentageFilled;

  _RatingStarClipper(this.percentageFilled);

  @override
  Rect getClip(Size size) {
    // Crea un rectángulo que recorta la parte de la estrella a mostrar
    return Rect.fromLTRB(0, 0, size.width * percentageFilled, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
