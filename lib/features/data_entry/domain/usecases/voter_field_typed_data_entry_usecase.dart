import 'package:pappa_connect/core/usecase/usecase.dart';

class VoterFieldTypedDataEntryUseCase extends UseCase {
  VoterFieldTypedDataEntryUseCase();

  @override
  Future call({params}) async {
    int index = params['index'];
    String field = params['field'];
    String value = params['value'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    dataEntryData['voters'][index][field] = value;

    return dataEntryData;
  }
}
