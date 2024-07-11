import 'package:pappa_connect/core/usecase/usecase.dart';

class WebsiteLoadedDataEntryUseCase extends UseCase {
  WebsiteLoadedDataEntryUseCase();

  @override
  Future call({params}) async {
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    dataEntryData['is_website_loaded'] = true;
  }
}
