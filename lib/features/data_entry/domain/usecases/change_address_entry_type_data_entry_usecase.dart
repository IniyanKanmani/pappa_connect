import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pappa_connect/core/usecase/usecase.dart';

class ChangeAddressEntryTypeDataEntryUseCase extends UseCase {
  ChangeAddressEntryTypeDataEntryUseCase();

  @override
  Future call({params}) async {
    String type = params['type'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    dataEntryData['address_entry_type'] = type;

    if (type == 'location') {
      bool locationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!locationEnabled) {
        // Location Disabled
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if ([LocationPermission.always, LocationPermission.whileInUse]
          .contains(permission)) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        Placemark place = placemarks[0];

        dataEntryData['address']['line-1'] = place.street ?? "";
        dataEntryData['address']['line-2'] = '';
        dataEntryData['address']['city'] = place.locality ?? "";
        dataEntryData['address']['county'] = place.subAdministrativeArea ?? "";
        dataEntryData['address']['postcode'] =
            (place.postalCode ?? "").split(" ").join();
      }
    }
  }
}
