class RecommendationTrendsItemModel {
  final int _buy;
  final int _hold;
  final String _period;
  final int _sell;
  final int _strongBuy;
  final int _strongSell;
  final String _symbol;

  RecommendationTrendsItemModel(
      {required int buy,
      required int hold,
      required String period,
      required int sell,
      required int strongBuy,
      required int strongSell,
      required String symbol})
      : _buy = buy,
        _hold = hold,
        _period = period,
        _sell = sell,
        _strongBuy = strongBuy,
        _strongSell = strongSell,
        _symbol = symbol;

  int get buy => _buy;

  int get hold => _hold;

  String get period => _period;

  int get sell => _sell;

  int get strongBuy => _strongBuy;

  int get strongSell => _strongSell;

  String get symbol => _symbol;
}
