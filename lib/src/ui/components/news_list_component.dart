import 'package:flutter/material.dart';
import 'package:hermes/src/core/decoration/container_decoration.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/ui/simple_components/date_component.dart';
import 'package:hermes/src/ui/simple_components/link_component.dart';
import 'package:hermes/src/ui/simple_components/network_asset_png.dart';
import 'package:hermes/src/ui/simple_components/text_with_label.dart';

class NewsListComponent extends StatelessWidget {
  const NewsListComponent({
    super.key,
    required String headline,
    required String image,
    required String source,
    required String category,
    required String summary,
    required String arcticleUrl,
    required DateTime date,
  })  : _date = date,
        _arcticleUrl = arcticleUrl,
        _summary = summary,
        _category = category,
        _source = source,
        _image = image,
        _headline = headline;

  final String _headline;
  final String _image;
  final String _source;
  final String _category;
  final String _summary;
  final String _arcticleUrl; //url
  final DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            decoration: ContainerDecoration.darkDecoration,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  NetworkImageAsset(imageUrl: _image),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    runSpacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _headline,
                            textAlign: TextAlign.start,
                            style: TextStyler.largeBold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWithLabel(label: 'Source', text: _source),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWithLabel(label: 'Category: ', text: _category),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            _summary,
                            style: TextStyler.regular,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LinkComponent(webUrl: _arcticleUrl, title: 'Source'),
                          DateComponent(
                            datetime: _date,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
