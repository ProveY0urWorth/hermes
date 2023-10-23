import 'package:hermes/src/models/symbol_lookup_item_model.dart';

class SymbolLookupRespondeModel {
  late int _count;
  List<SymbolLookupItemModel> _result = [];

  SymbolLookupRespondeModel.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    List<SymbolLookupItemModel> temp = [];
    for (int i = 0; i < _count; i++) {
      SymbolLookupItemModel resultModel =
          SymbolLookupItemModel.fromJson(json['result'][i]);
      temp.add(resultModel);
    }
    _result = temp;
  }

  List<SymbolLookupItemModel> get results => _result;

  int get count => _count;
}
