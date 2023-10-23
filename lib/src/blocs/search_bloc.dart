import 'package:hermes/src/models/symbol_lookup_responde_model.dart';
import 'package:hermes/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final _repository = Repository();
  final _searchFetcher = PublishSubject<SymbolLookupRespondeModel>();

  Stream<SymbolLookupRespondeModel> get search => _searchFetcher.stream;

  fetchSearchResults(String symbol) async {
    SymbolLookupRespondeModel responseModel =
        await _repository.fetchSearchResults(symbol);
    _searchFetcher.sink.add(responseModel);
  }

  dispose() {
    _searchFetcher.close();
  }
}

final searchBloc = SearchBloc();
