import 'package:pappa_connect/core/services/firestore.dart';
import 'package:pappa_connect/features/data_entry/domain/repositories/data_entry_repository.dart';
import 'package:pappa_connect/injection_container.dart';

class DataEntryRepositoryImplementation implements DataEntryRepository {
  final Firestore _firestore = sl.get<Firestore>();

  @override
  Future<void> saveVoterData(Map<String, dynamic> data) async {
    List<Map<String, dynamic>> voters = data['voters'];
    List<String> voterIds = [];

    for (Map<String, dynamic> voter in voters) {
      String id = await _firestore.createDocument(path: "voters", data: voter);
      voterIds.add(id);
    }

    Map<String, dynamic> address = {
      ...data['address'],
      "voter_ids": voterIds,
    };

    await _firestore.createDocument(path: "addresses", data: address);
  }
}
