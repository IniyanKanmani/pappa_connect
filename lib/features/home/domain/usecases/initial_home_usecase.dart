import 'package:pappa_connect/core/usecase/usecase.dart';

class InitialHomeUseCase extends UseCase {
  InitialHomeUseCase();

  @override
  Future call({params}) async {
    Map<String, dynamic> homeData = {};

    homeData['index'] = 0;

    return homeData;
  }
}
