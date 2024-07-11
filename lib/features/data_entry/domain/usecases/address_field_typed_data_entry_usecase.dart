import 'package:pappa_connect/core/usecase/usecase.dart';

class AddressFieldTypedDataEntryUseCase extends UseCase {
  AddressFieldTypedDataEntryUseCase();

  @override
  Future call({params}) async {
    String field = params['field'];
    String value = params['value'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    dataEntryData['address'][field] = value;
  }
}
