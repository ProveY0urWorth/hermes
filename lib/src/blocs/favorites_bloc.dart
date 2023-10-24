import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class FavoritesBloc {
  final _repository = Repository();
  final _favoritesFetcher = PublishSubject<List<CompanyInfoModel>>();

  Stream<List<CompanyInfoModel>> get favorites => _favoritesFetcher.stream;

  
}

final favoritesBloc = FavoritesBloc();
