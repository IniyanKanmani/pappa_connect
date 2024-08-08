import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pappa_connect/core/local_database/local_database.dart';
import 'package:pappa_connect/core/local_database/repository/local_database_repository.dart';
import 'package:pappa_connect/features/home/presentation/views/home_view.dart';
import 'package:pappa_connect/firebase_options.dart';
import 'package:pappa_connect/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await sl.get<LocalDatabase>().init();
  sl.get<LocalDatabaseRepository>().fetchData();

  runApp(const PappaConnectApp());
}

class PappaConnectApp extends StatelessWidget {
  const PappaConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Pappa Connect',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
      locale: const Locale('en', 'UK'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      home: HomeView(),
    );
  }
}
