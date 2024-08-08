import 'package:pappa_connect/core/local_database/local_database.dart';
import 'package:pappa_connect/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImplementation implements SearchRepository {
  SearchRepositoryImplementation(this._localDB);
  final LocalDatabase _localDB;

  @override
  List<Map<String, dynamic>> getAddresses() {
    return _localDB.addressModel.values
        .map((element) => element.toAddress())
        .toList();
  }
}
