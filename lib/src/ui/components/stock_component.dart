import 'package:flutter/material.dart';
import 'package:hermes/src/core/decoration/container_decoration.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/ui/simple_components/date_component.dart';

class StockComponent extends StatelessWidget {
  const StockComponent(
      {super.key,
      required String symbol,
      required double percentChange,
      required double highPrice,
      required double lowPrice,
      required double openPrice,
      required double previousClosePrice,
      required DateTime dateTime})
      : _symbol = symbol,
        _percentChange = percentChange,
        _highPrice = highPrice,
        _lowPrice = lowPrice,
        _openPrice = openPrice,
        _previousClosePrice = previousClosePrice,
        _time = dateTime;

  final String _symbol;
  final double _percentChange;
  final double _highPrice;
  final double _lowPrice;
  final double _openPrice;
  final double _previousClosePrice;
  final DateTime _time;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: ContainerDecoration.darkDecoration,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  _symbol,
                  style: TextStyler.bold,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'Current Price: $_openPrice ($_percentChange %)'),
                      WidgetSpan(
                        child: _percentChange < 0
                            ? const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.redAccent,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: Colors.greenAccent,
                              ),
                      )
                    ],
                  ),
                ),
                Text('High price: $_highPrice Low price : $_lowPrice'),
                Text('Previous close price: $_previousClosePrice'),
                DateComponent(datetime: _time)
              ],
            ),
          ),
        ));
  }
}
