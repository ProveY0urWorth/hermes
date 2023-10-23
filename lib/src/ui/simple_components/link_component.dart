import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkComponent extends StatelessWidget {
  const LinkComponent({super.key, required this.webUrl, required this.title});
  final String webUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyler.link,
            text: title,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                var url = Uri.parse(webUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw "Cannot launch url!";
                }
              }));
  }
}
