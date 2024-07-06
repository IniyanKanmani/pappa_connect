import 'package:pappa_connect/core/usecase/usecase.dart';

class ViewChangeHomeUseCase extends UseCase {
  ViewChangeHomeUseCase();

  @override
  Future call({params}) async {
    int index = params['index'];
    Map<String, dynamic> homeData = params['home_data'];

    homeData['index'] = index;

    return homeData;
  }
}
