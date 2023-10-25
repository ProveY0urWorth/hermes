import 'package:flutter/material.dart';
import 'package:hermes/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkSVGAsset extends StatelessWidget {
  const NetworkSVGAsset({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SvgPicture.network(
          imageUrl,
          height: 100,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(Assets.images.placeholder.path)),
        ),
      ),
    );
  }
}
