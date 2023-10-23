import 'market_news_item_model.dart';

class MarketNewsResponseModel {
  late int _totalResults;
  List<MarketNewsItemModel> _results = [];

  MarketNewsResponseModel.fromJson(parsedJson) {
    _totalResults = parsedJson.length;
    List<MarketNewsItemModel> temp = [];
    for (int i = 0; i < _totalResults; i++) {
      MarketNewsItemModel resultModel =
          MarketNewsItemModel.fromJson(parsedJson[i]);
      temp.add(resultModel);
    }
    _results = temp;
  }

  List<MarketNewsItemModel> get results => _results;
  int get totalResults => _totalResults;
}
