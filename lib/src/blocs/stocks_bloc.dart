import 'package:hermes/src/models/stock_db_model.dart';
import 'package:hermes/src/models/stock_item_model.dart';
import 'package:hermes/src/models/symbol_lookup_item_model.dart';
import 'package:hermes/src/resources/database_service.dart';
import 'package:hermes/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class StocksBloc {
  final _repository = Repository();
  final _stockFetcher = PublishSubject<List<StockItemModel>>();
  late List<String> _symbolsNames = [];

  Stream<List<StockItemModel>> get stocks => _stockFetcher.stream;
  List<String> get names => _symbolsNames;

  Future<StockItemModel> fetchStocksBySymbol(String symbol) async {
    StockItemModel responseModel =
        await _repository.fetchStockForSymbol(symbol);
    return responseModel;
  }

  Future<List<String>> getSymbolsFromDB() async {
    var db = DatabaseService();
    List<String> symbols = await db.getAllStocksSymbols();
    return symbols;
  }

  fetchStoksList() async {
    _symbolsNames = await getSymbolsFromDB();
    List<StockItemModel> resultList = [];
    for (var symbol in _symbolsNames) {
      resultList.add(await fetchStocksBySymbol(symbol));
    }
    _stockFetcher.sink.add(resultList);
  }

  addStockToDB(SymbolLookupItemModel model) async {
    var db = DatabaseService();
    int id = await db.getLastItemId();
    db.insertStock(Stock(
        id: id + 1,
        symbol: model.symbol,
        displaySymbol: model.displaySymbol,
        description: model.description,
        type: model.type));
  }

  removeStockFromDB(String symbol) async {
    var db = DatabaseService();
    db.deleteStock(symbol);
  }

  bool isSymbolInDB(String symbol) {
    return _symbolsNames.contains(symbol);
  }

  dispose() {
    _stockFetcher.close();
  }
}

final stocksBloc = StocksBloc();
