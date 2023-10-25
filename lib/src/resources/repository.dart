import 'package:hermes/src/core/enums/finhub_enums.dart';
import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/models/market_news_response_model.dart';
import 'package:hermes/src/models/stock_item_model.dart';
import 'package:hermes/src/models/symbol_lookup_responde_model.dart';
import 'package:hermes/src/resources/finhub_api_provider.dart';

class Repository {
  final provider = FinhubAPIProvider();

  Future<MarketNewsResponseModel> fetchGeneralNews() =>
      provider.getMarketNews(NewsType.general.stringType);

  Future<MarketNewsResponseModel> fetchCryptoNews() =>
      provider.getMarketNews(NewsType.crypto.stringType);

  Future<MarketNewsResponseModel> fetchForexNews() =>
      provider.getMarketNews(NewsType.forex.stringType);

  Future<MarketNewsResponseModel> fetchMergerNews() =>
      provider.getMarketNews(NewsType.merger.stringType);

  Future<SymbolLookupRespondeModel> fetchSearchResults(String symbol) =>
      provider.getSearchResults(symbol);

  Future<StockItemModel> fetchStockForSymbol(String symbol) =>
      provider.getStockForSymbol(symbol);

  Future<CompanyInfoModel> fetchCompanyInfo(String symbol) =>
      provider.getCompanyInfo(symbol);

  Future<MarketNewsResponseModel> fetchCompanyNews(String symbol) =>
      provider.getCompanyNews(symbol);
}
