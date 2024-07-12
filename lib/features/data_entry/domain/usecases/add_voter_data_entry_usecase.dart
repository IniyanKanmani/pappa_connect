import 'package:pappa_connect/core/usecase/usecase.dart';

class AddVoterDataEntryUseCase extends UseCase {
  AddVoterDataEntryUseCase();

  @override
  Future call({params}) async {
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    dataEntryData['voters'].add({
      'firstname': '',
      'lastname': '',
      'email': '',
      'contact_no': '',
      'registered_to_vote': null,
      'vote_type': null,
      'party_member': null,
      'voter_intent': null,
      'council_vote': null,
      'county_vote': null,
      'country_vote': null,
      'member': null,
      'volunteer': null,
      'advertise': null,
      'comments': '',
    });
  }
}
