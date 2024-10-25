import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:newsly/core/constants/app_constants.dart';

class NewsImage extends StatelessWidget {
  const NewsImage(
      {super.key,
      required this.url,
      required this.width,
      required this.height});
  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        height: height,
        errorWidget: (context, url, error) {
          return Image.asset(
            AppConstants.placeholder,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
