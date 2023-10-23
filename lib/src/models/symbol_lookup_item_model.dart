class SymbolLookupItemModel {
  late String _description;
  late String _displaySymbol;
  late String _symbol;
  late String _type;

  SymbolLookupItemModel(
      {required String description,
      required String displaySymbol,
      required String symbol,
      required String type})
      : _description = description,
        _displaySymbol = displaySymbol,
        _symbol = symbol,
        _type = type;

  SymbolLookupItemModel.fromJson(Map<String, dynamic> result) {
    _description = result['description'];
    _displaySymbol = result['displaySymbol'];
    _symbol = result['symbol'];
    _type = result['type'];
  }

  String get description => _description;

  String get displaySymbol => _displaySymbol;

  String get symbol => _symbol;

  String get type => _type;
}
