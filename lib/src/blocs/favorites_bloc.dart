import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/resources/database_service.dart';
import 'package:hermes/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class FavoritesBloc {
  final _favoritesFetcher = PublishSubject<List<CompanyInfoModel>>();
  final _repository = Repository();

  Stream<List<CompanyInfoModel>> get favorites => _favoritesFetcher.stream;

  fetchCompaniesList() async {
    var db = DatabaseService();
    var _symbolsNames = await db.getAllStocksSymbols();

    List<CompanyInfoModel> _resultList = [];
    for (var symbol in _symbolsNames) {
      _resultList.add(await _repository.fetchCompanyInfo(symbol));
    }
    _favoritesFetcher.add(_resultList);
  }

  dispose() {
    _favoritesFetcher.close();
  }
}

final favoritesBloc = FavoritesBloc();
