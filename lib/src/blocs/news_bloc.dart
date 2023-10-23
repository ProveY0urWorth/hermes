import 'package:hermes/src/models/market_news_response_model.dart';
import 'package:hermes/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = Repository();
  final _newsFetcher = PublishSubject<MarketNewsResponseModel>();

  Stream<MarketNewsResponseModel> get news => _newsFetcher.stream;

  fetchGeneralNews() async {
    MarketNewsResponseModel responseModel =
        await _repository.fetchGeneralNews();
    _newsFetcher.sink.add(responseModel);
  }

  fetchCryptoNews() async {
    MarketNewsResponseModel responseModel = await _repository.fetchCryptoNews();
    _newsFetcher.sink.add(responseModel);
  }

  fetchForexNews() async {
    MarketNewsResponseModel responseModel = await _repository.fetchForexNews();
    _newsFetcher.sink.add(responseModel);
  }

  fetchMergerNews() async {
    MarketNewsResponseModel responseModel = await _repository.fetchMergerNews();
    _newsFetcher.sink.add(responseModel);
  }

  dispose() {
    _newsFetcher.close();
  }
}

final newsBloc = NewsBloc();
