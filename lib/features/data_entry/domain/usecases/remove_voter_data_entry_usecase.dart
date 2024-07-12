import 'package:pappa_connect/core/usecase/usecase.dart';

class RemoveVoterDataEntryUseCase extends UseCase {
  RemoveVoterDataEntryUseCase();

  @override
  Future call({params}) async {
    int index = params['index'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    dataEntryData["voters"].removeAt(index);
  }
}
