import 'package:flutter/material.dart';
import 'package:hermes/gen/assets.gen.dart';

class NetworkImageAsset extends StatelessWidget {
  const NetworkImageAsset({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage.assetNetwork(
            placeholder: Assets.images.placeholder.path,
            image: imageUrl,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(Assets.images.placeholder.path);
            },
          )),
    );
  }
}
