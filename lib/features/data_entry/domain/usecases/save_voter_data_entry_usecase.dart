import 'package:pappa_connect/core/usecase/usecase.dart';

class SaveVoterDataEntryUseCase extends UseCase {
  SaveVoterDataEntryUseCase();

  @override
  Future call({params}) async {
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    // Save Voter Data
    print(dataEntryData);
  }
}
