enum NewsType {
  general('general'),
  crypto('crypto'),
  forex('forex'),
  merger('merger');

  const NewsType(this.value);

  final String value;

  String get stringType => value;
}
