import 'package:pappa_connect/core/local_database/local_database.dart';
import 'package:pappa_connect/core/local_database/models/address_hive_model.dart';
import 'package:pappa_connect/core/services/firestore.dart';
import 'package:pappa_connect/injection_container.dart';

class LocalDatabaseRepository {
  LocalDatabaseRepository(this._localDB);

  final LocalDatabase _localDB;

  void fetchData() {
    sl
        .get<Firestore>()
        .listenToDocumentChanges(path: "addresses")
        .listen((snapshot) async {
      for (var element in snapshot.docChanges) {
        if (element.type.name == "added") {
          await _localDB.addressModel.add(AddressHiveModel.fromMap({
            "uid": element.doc.id,
            ...element.doc.data()! as Map<String, dynamic>,
          }));
        } else if (element.type.name == "modified") {
          int index = _localDB.addressModel.values
              .toList()
              .indexWhere((ele) => ele.uid == element.doc.id);

          await _localDB.addressModel.putAt(
              index,
              AddressHiveModel.fromMap({
                "uid": element.doc.id,
                ...element.doc.data()! as Map<String, dynamic>,
              }));
        } else if (element.type.name == "removed") {
          int index = _localDB.addressModel.values
              .toList()
              .indexWhere((ele) => ele.uid == element.doc.id);

          await _localDB.addressModel.deleteAt(index);
        }
      }
    });
  }
}
