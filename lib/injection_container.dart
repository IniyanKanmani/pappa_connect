import 'package:get_it/get_it.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/add_voter_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/address_field_typed_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/address_selected_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/change_address_entry_type_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/initial_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/new_scrapped_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/postcode_search_field_typed_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/remove_voter_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/save_voter_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/voter_field_typed_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/website_loaded_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/presentation/bloc/data_entry_bloc.dart';
import 'package:pappa_connect/features/home/domain/usecases/initial_home_usecase.dart';
import 'package:pappa_connect/features/home/domain/usecases/view_change_home_usecase.dart';
import 'package:pappa_connect/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Home
  sl.registerLazySingleton<InitialHomeUseCase>(() => InitialHomeUseCase());
  sl.registerLazySingleton<ViewChangeHomeUseCase>(
      () => ViewChangeHomeUseCase());
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl()));

  // Data Entry
  sl.registerLazySingleton<InitialDataEntryUseCase>(
      () => InitialDataEntryUseCase());
  sl.registerLazySingleton<WebsiteLoadedDataEntryUseCase>(
      () => WebsiteLoadedDataEntryUseCase());
  sl.registerLazySingleton<ChangeAddressEntryTypeDataEntryUseCase>(
      () => ChangeAddressEntryTypeDataEntryUseCase());
  sl.registerLazySingleton<PostcodeSearchFieldTypedDataEntryUseCase>(
      () => PostcodeSearchFieldTypedDataEntryUseCase());
  sl.registerLazySingleton<NewScrappedDataEntryUseCase>(
      () => NewScrappedDataEntryUseCase());
  sl.registerLazySingleton<AddressSelectedDataEntryUseCase>(
      () => AddressSelectedDataEntryUseCase());
  sl.registerLazySingleton<AddressFieldTypedDataEntryUseCase>(
      () => AddressFieldTypedDataEntryUseCase());
  sl.registerLazySingleton<VoterFieldTypedDataEntryUseCase>(
      () => VoterFieldTypedDataEntryUseCase());
  sl.registerLazySingleton<AddVoterDataEntryUseCase>(
      () => AddVoterDataEntryUseCase());
  sl.registerLazySingleton<RemoveVoterDataEntryUseCase>(
      () => RemoveVoterDataEntryUseCase());
  sl.registerLazySingleton<SaveVoterDataEntryUseCase>(
      () => SaveVoterDataEntryUseCase());
  sl.registerFactory<DataEntryBloc>(() => DataEntryBloc(
      sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
}
