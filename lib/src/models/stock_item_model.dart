class StockItemModel {
  late double _currentPrice;
  late double _change;
  late double _percentChange;
  late double _highPrice;
  late double _lowPrice;
  late double _openPrice;
  late double _previousClosePrice;
  late DateTime _time;

  StockItemModel(
      {required double currentPrice,
      required double change,
      required double percentChange,
      required double highPrice,
      required double lowPrice,
      required double openPrice,
      required double previousClosePrice,
      required int dateTime})
      : _currentPrice = currentPrice,
        _change = change,
        _percentChange = percentChange,
        _highPrice = highPrice,
        _lowPrice = lowPrice,
        _openPrice = openPrice,
        _previousClosePrice = previousClosePrice,
        _time = DateTime.fromMillisecondsSinceEpoch(dateTime * 1000);

  StockItemModel.fromJson(Map<String, dynamic> result) {
    _currentPrice = result['c'].toDouble();
    _change = result['d'].toDouble();
    _percentChange = result['dp'].toDouble();
    _highPrice = result['h'].toDouble();
    _lowPrice = result['l'].toDouble();
    _openPrice = result['o'].toDouble();
    _previousClosePrice = result['pc'].toDouble();
    _time = DateTime.fromMillisecondsSinceEpoch(result['t'] * 1000);
  }

  double get currentPrice => _currentPrice;

  double get change => _change;

  double get percentChange => _percentChange;

  double get highPrice => _highPrice;

  double get lowPrice => _lowPrice;

  double get openPrice => _openPrice;

  double get previousClosePrice => _previousClosePrice;

  DateTime get time => _time;
}
