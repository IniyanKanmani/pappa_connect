import 'package:hive/hive.dart';
import 'package:pappa_connect/core/local_database/models/address_hive_model.dart';

class LocalDatabase {
  late Box<AddressHiveModel> addressModel;

  Future<void> init() async {
    Hive.registerAdapter(AddressHiveModelAdapter());

    addressModel = await Hive.openBox('address');

    await addressModel.clear();
  }
}
