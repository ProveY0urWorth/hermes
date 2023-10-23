class Stock {
  final int _id;
  final String _symbol;
  final String _displaySymbol;
  final String _description;
  final String _type;
  const Stock(
      {required int id,
      required String symbol,
      required String displaySymbol,
      required String description,
      required String type})
      : _id = id,
        _symbol = symbol,
        _displaySymbol = displaySymbol,
        _description = description,
        _type = type;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'symbol': _symbol,
      'displaySymbol': _displaySymbol,
      'description': _description,
      'type': _type,
    };
  }

  @override
  String toString() {
    return 'Stock{id: $_id,symbol: $_symbol,displaySymbol: $_displaySymbol, description: $_description, type: $_type}';
  }

  int get id => _id;

  String get symbol => _symbol;

  String get displaySymbol => _displaySymbol;

  String get description => _description;

  String get type => _type;
}
