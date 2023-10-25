import 'dart:async';
import 'dart:convert';

import 'package:hermes/src/core/constants/finhub_constats.dart';
import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/models/market_news_response_model.dart';
import 'package:hermes/src/models/stock_item_model.dart';
import 'package:hermes/src/models/symbol_lookup_responde_model.dart';
import 'package:http/http.dart';

class FinhubAPIProvider {
  Client client = Client();
  final _apiKey = finhubAPIKey;
  final _baseUrl = 'https://finnhub.io/api/v1';

  Future<MarketNewsResponseModel> getMarketNews(String category) async {
    final response = await client
        .get(Uri.parse("$_baseUrl/news?category=$category&token=$_apiKey"));
    if (response.statusCode == 200) {
      return MarketNewsResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load market news');
    }
  }

  Future<SymbolLookupRespondeModel> getSearchResults(String symbol) async {
    final response = await client
        .get(Uri.parse("$_baseUrl/search?q=$symbol&token=$_apiKey"));
    if (response.statusCode == 200) {
      return SymbolLookupRespondeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search results');
    }
  }

  Future<StockItemModel> getStockForSymbol(String symbol) async {
    final response = await client
        .get(Uri.parse("$_baseUrl/quote?symbol=$symbol&token=$_apiKey"));
    if (response.statusCode == 200) {
      return StockItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load stock data for symbol!');
    }
  }

  Future<CompanyInfoModel> getCompanyInfo(String symbol) async {
    final response = await client.get(
        Uri.parse("$_baseUrl/stock/profile2?symbol=$symbol&token=$_apiKey"));
    if (response.statusCode == 200) {
      return CompanyInfoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load company info!');
    }
  }

  Future<MarketNewsResponseModel> getCompanyNews(String symbol) async {
    DateTime now = DateTime.now();
    //DateTime date = DateTime(now.year, now.month, now.day);
    String dateNow = '${now.year}-${now.month}-${now.day}';
    String dateThen = '${now.year - 1}-${now.month}-${now.day}';
    final response = await client.get(Uri.parse(
        '$_baseUrl/company-news?symbol=$symbol&from=$dateThen&to=$dateNow&token=$_apiKey'));
    if (response.statusCode == 200) {
      return MarketNewsResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load company news');
    }
  }
}
