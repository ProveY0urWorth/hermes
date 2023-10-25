import 'package:hermes/src/blocs/stocks_bloc.dart';
import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/models/market_news_response_model.dart';
import 'package:hermes/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CompanyDataBloc {
  final _repository = Repository();
  final _companyDataFetcher = PublishSubject<CompanyInfoModel>();
  final _companyNewsFetcher = PublishSubject<MarketNewsResponseModel>();
  final _isLikedStream = BehaviorSubject<bool>.seeded(false);
  bool _isLiked = false;

  Stream<CompanyInfoModel> get companyData => _companyDataFetcher.stream;
  Stream<MarketNewsResponseModel> get companyNews => _companyNewsFetcher.stream;
  Stream<bool> get isLiked => _isLikedStream.stream;

  fetchCompanyData(String symbol) async {
    CompanyInfoModel responseModel = await _repository.fetchCompanyInfo(symbol);
    _companyDataFetcher.sink.add(responseModel);
    _isLiked = stocksBloc.isSymbolInDB(symbol);
    _isLikedStream.add(_isLiked);
  }

  fetchCompanyNews(String symbol) async {
    MarketNewsResponseModel responseModel =
        await _repository.fetchCompanyNews(symbol);
    _companyNewsFetcher.sink.add(responseModel);
  }

  void changeIsLiked() {
    _isLiked = !_isLiked;
    _isLikedStream.add(_isLiked);
  }

  dispose() {
    _companyDataFetcher.close();
    _isLikedStream.close();
    _companyNewsFetcher.close();
  }
}

final companyDataBloc = CompanyDataBloc();
