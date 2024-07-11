import 'dart:convert';

import 'package:pappa_connect/core/usecase/usecase.dart';

class NewScrappedDataEntryUseCase extends UseCase {
  NewScrappedDataEntryUseCase();

  @override
  Future call({params}) async {
    String newData = params['new_data'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    List<String?> decodedData = jsonDecode(newData).cast<String?>();
    if (decodedData.contains(null)) {
      decodedData = [];
    }

    dataEntryData["addresses"] = decodedData;
  }
}
