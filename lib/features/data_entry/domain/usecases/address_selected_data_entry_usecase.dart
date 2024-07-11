import 'package:pappa_connect/core/usecase/usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/repositories/data_entry_repository.dart';

class AddressSelectedDataEntryUseCase extends UseCase {
  AddressSelectedDataEntryUseCase(this._dataEntryRepository);

  final DataEntryRepository _dataEntryRepository;

  @override
  Future call({params}) async {
    String address = params['address'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    String postCode = dataEntryData['postcode_search']
        .toString()
        .split(" ")
        .first
        .toUpperCase();

    List<String> splitAddress = address.split(", ");

    dataEntryData['address']['line-1'] =
        splitAddress.length == 4 ? splitAddress[1] : splitAddress[0];
    dataEntryData['address']['line-2'] =
        splitAddress.length == 4 ? splitAddress[0] : '';
    dataEntryData['address']['city'] = splitAddress[splitAddress.length - 2];
    dataEntryData['address']['county'] =
        await _dataEntryRepository.getPostcodeCounty(postCode);
    dataEntryData['address']['postcode'] = postCode;

    dataEntryData['postcode_search_edited'] = false;
  }
}
