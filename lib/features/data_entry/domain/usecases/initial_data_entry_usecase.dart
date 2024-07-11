import 'package:pappa_connect/core/usecase/usecase.dart';

class InitialDataEntryUseCase extends UseCase {
  InitialDataEntryUseCase();

  @override
  Future call({params}) async {
    Map<String, dynamic> dataEntryData = {};

    dataEntryData['is_website_loaded'] = false;
    dataEntryData['address_entry_type'] = 'manual';
    dataEntryData['postcode_search'] = '';
    dataEntryData['postcode_search_edited'] = false;
    dataEntryData['addresses'] = [];

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
        'registered_to_vote': null,
        'vote_type': null,
        'party_member': null,
        'voter_intent': null,
        'council_vote': null,
        'county_vote': null,
        'country_vote': null,
        'comments': '',
      },
    ];

    return dataEntryData;
  }
}
