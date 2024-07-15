import 'package:pappa_connect/core/usecase/usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/repositories/data_entry_repository.dart';

class SaveVoterDataEntryUseCase extends UseCase {
  SaveVoterDataEntryUseCase(this._dataEntryRepository);

  final DataEntryRepository _dataEntryRepository;

  @override
  Future call({params}) async {
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    await _dataEntryRepository.saveVoterData(dataEntryData);
  }
}
