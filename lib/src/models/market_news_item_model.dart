class MarketNewsItemModel {
  late int _id;
  late String _headline;
  late String _image;
  late String _source;
  late String _category;
  late String _summary;
  late String _arcticleUrl; //url
  late DateTime _date; // convert from timestamp

  MarketNewsItemModel({
    required int id,
    required String headline,
    required String image,
    required String source,
    required String category,
    required String summary,
    required String arcticleUrl,
    required DateTime date,
  })  : _date = date,
        _arcticleUrl = arcticleUrl,
        _summary = summary,
        _category = category,
        _source = source,
        _image = image,
        _headline = headline,
        _id = id;

  MarketNewsItemModel.fromJson(Map<String, dynamic> result) {
    _id = result['id'];
    _headline = result['headline'];
    _image = result['image'];
    _source = result['source'];
    _category = result['category'];
    _summary = result['summary'];
    _arcticleUrl = result['url'];
    _date = DateTime.fromMillisecondsSinceEpoch(result['datetime'] * 1000);
  }

  int get id => _id;
  String get headline => _headline;
  String get image => _image;
  String get source => _source;
  String get category => _category;
  String get summary => _summary;
  String get articleUrl => _arcticleUrl;
  DateTime get date => _date;
}
