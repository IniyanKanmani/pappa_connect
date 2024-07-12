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

    dataEntryData['parties'] = [
      'Labour',
      'Conservatives',
      'Liberal Democrats',
      'Green',
      'Reform UK',
      'Other',
    ];

    dataEntryData['bool'] = [
      'Yes',
      'No',
    ];

    dataEntryData['vote_types'] = [
      'In Person',
      'Postal',
    ];

    dataEntryData['address'] = {
      'street': '',
      'flat': '',
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
        'member': null,
        'volunteer': null,
        'advertise': null,
        'comments': '',
      },
    ];

    return dataEntryData;
  }
}
