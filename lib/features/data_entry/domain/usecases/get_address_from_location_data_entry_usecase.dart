import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pappa_connect/core/usecase/usecase.dart';

class GetAddressFromLocationDataEntryUseCase extends UseCase {
  GetAddressFromLocationDataEntryUseCase();

  @override
  Future call({params}) async {
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

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

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      print(place);
    }
  }
}
