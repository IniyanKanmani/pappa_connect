import 'package:geocoding/geocoding.dart';
import 'package:pappa_connect/core/usecase/usecase.dart';

class AddressSelectedDataEntryUseCase extends UseCase {
  AddressSelectedDataEntryUseCase();

  @override
  Future call({params}) async {
    String address = params['address'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    dataEntryData['postcode_search_edited'] = false;
    List<String> splitAddress = address.split(", ");

    Location location = (await locationFromAddress(address))[0];

    Placemark place = (await placemarkFromCoordinates(
        location.latitude, location.longitude))[0];

    dataEntryData['address']['street'] =
        splitAddress.length == 4 ? splitAddress[1] : splitAddress[0];
    dataEntryData['address']['flat'] =
        splitAddress.length == 4 ? splitAddress[0] : '';
    dataEntryData['address']['city'] = splitAddress[splitAddress.length - 2];
    dataEntryData['address']['county'] = place.subAdministrativeArea;
    dataEntryData['address']['postcode'] =
        (place.postalCode ?? "").split(" ").join();
  }
}
