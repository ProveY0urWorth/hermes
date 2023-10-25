// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hermes/src/core/decoration/container_decoration.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/ui/simple_components/link_component.dart';
import 'package:hermes/src/ui/simple_components/network_asset_svg.dart';
import 'package:hermes/src/ui/simple_components/text_with_label.dart';

class CompanyListComponent extends StatelessWidget {
  const CompanyListComponent(
      {super.key,
      required industry,
      required logo,
      required name,
      required ticker,
      required website})
      : _industry = industry,
        _logo = logo,
        _name = name,
        _ticker = ticker,
        _website = website;

  final String _industry;
  final String _logo;
  final String _name;
  final String _ticker;
  final String _website;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: ContainerDecoration.darkDecoration,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              NetworkSVGAsset(imageUrl: _logo),
              const SizedBox(width: 5),
              SizedBox(
                width: 200,
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Column(
                      children: [
                        Text(
                          _name,
                          textAlign: TextAlign.start,
                          style: TextStyler.largeBold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextWithLabel(label: 'Industry: ', text: _industry),
                        const SizedBox(
                          height: 5,
                        ),
                        TextWithLabel(label: 'Ticker: ', text: _ticker),
                        const SizedBox(
                          height: 5,
                        ),
                        LinkComponent(webUrl: _website, title: 'WebSite'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
