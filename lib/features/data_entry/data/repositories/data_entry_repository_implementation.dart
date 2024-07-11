import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pappa_connect/features/data_entry/domain/repositories/data_entry_repository.dart';

class DataEntryRepositoryImplementation implements DataEntryRepository {
  @override
  Future<String> getPostcodeCounty(String postcode) async {
    try {
      var res = await http
          .get(Uri.parse("https://api.postcodes.io/postcodes/$postcode"));

      if (res.statusCode == 200) {
        Map decodedData = jsonDecode(res.body);
        return decodedData["result"]["pfa"];
      }
    } catch (e) {
      print(e);
    }
    return '';
  }
}
