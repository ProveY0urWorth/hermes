class CompanyInfoModel {
  late String _country; //company headquaters
  late String _currency;
  late String _exchange;
  late String _ipo;
  late double _marketCapitalization;
  late String _name;
  late String _phone;
  late double _shareOutstanding;
  late String _ticker;
  late String _weburl;
  late String _logo;
  late String _finnhubIndustry;

  CompanyInfoModel(
      {required String country,
      required String currency,
      required String exchange,
      required String ipo,
      required double marketCapitalization,
      required String name,
      required String phone,
      required double shareOutstanding,
      required String ticker,
      required String weburl,
      required String logo,
      required String finnhubIndustry})
      : _country = country,
        _currency = currency,
        _exchange = exchange,
        _ipo = ipo,
        _marketCapitalization = marketCapitalization,
        _name = name,
        _phone = phone,
        _shareOutstanding = shareOutstanding,
        _ticker = ticker,
        _weburl = weburl,
        _logo = logo,
        _finnhubIndustry = finnhubIndustry;

  String get country => _country;

  String get currency => _currency;

  String get exchange => _exchange;

  String get ipo => _ipo;

  double get marketCapitalization => _marketCapitalization;

  String get name => _name;

  String get phone => _phone;

  double get shareOutstanding => _shareOutstanding;

  String get ticker => _ticker;

  String get weburl => _weburl;

  String get logo => _logo;

  String get finnhubIndustry => _finnhubIndustry;

  CompanyInfoModel.fromJson(Map<String, dynamic> result) {
    _country = result['country'];
    _currency = result["currency"];
    _exchange = result["exchange"];
    _ipo = result["ipo"];
    _marketCapitalization = result["marketCapitalization"].toDouble();
    _name = result["name"];
    _phone = result["phone"].substring(0, result["phone"].length - 2);
    _shareOutstanding = result["shareOutstanding"].toDouble();
    _ticker = result["ticker"];
    _weburl = result["weburl"];
    _logo = result["logo"];
    _finnhubIndustry = result["finnhubIndustry"];
  }
}
