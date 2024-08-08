import 'package:pappa_connect/core/usecase/usecase.dart';
import 'package:pappa_connect/features/search/domain/repositories/search_repository.dart';

class InitialSearchUsecase extends UseCase {
  InitialSearchUsecase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future call({params}) async {
    Map<String, dynamic> searchData = {};

    searchData['search'] = "";
    searchData['mode'] = "view";
    searchData['addresses_data'] = _searchRepository.getAddresses();
    searchData['addresses'] = searchData['addresses_data']
        .map((element) => element.values.first as String)
        .toList();

    return searchData;
  }
}
