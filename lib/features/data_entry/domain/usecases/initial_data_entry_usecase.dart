import 'package:pappa_connect/core/usecase/usecase.dart';

class InitialDataEntryUseCase extends UseCase {
  InitialDataEntryUseCase();

  @override
  Future call({params}) async {
    Map<String, dynamic> dataEntryData = {};

    dataEntryData['address_entry_type'] = 'manual';
    dataEntryData['address'] = {
      'line-1': '',
      'line-2': '',
      'city': '',
      'county': '',
      'postcode': '',
    };

    dataEntryData['voters'] = [
      {
        'firstname': '',
        'lastname': '',
        'email': '',
        'contact_no': '',
        'registered_to_vote': '',
        'vote_type': '',
        'party_member': '',
        'voter_intent': '',
        'council_vote': '',
        'county_vote': '',
        'country_vote': '',
        'comments': '',
      },
      {
        'firstname': '',
        'lastname': '',
        'email': '',
        'contact_no': '',
        'registered_to_vote': '',
        'vote_type': '',
        'party_member': '',
        'voter_intent': '',
        'council_vote': '',
        'county_vote': '',
        'country_vote': '',
        'comments': '',
      },
    ];

    return dataEntryData;
  }
}
