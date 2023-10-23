import 'package:hermes/src/models/stock_item_model.dart';

class StockResponseModel {
  late int _totalResults;
  List<StockItemModel> _result = [];

  StockResponseModel.fromJson(Map<String, dynamic> json) {
    List<StockItemModel> temp = [];
    var data = json['data'];
    _totalResults = data.length;
    for (int i = 0; i < _totalResults; i++) {
      StockItemModel resultModel = StockItemModel.fromJson(data[i]);
      temp.add(resultModel);
    }
    _result = temp;
  }
  int get totalResults => _totalResults;
  List<StockItemModel> get result => _result;
}
