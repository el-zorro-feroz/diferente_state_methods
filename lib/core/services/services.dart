import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:v/core/firebase/firebase_options.dart';
import 'package:v/core/services/services.config.dart';

final GetIt services = GetIt.I;

@InjectableInit()
Future<void> initServices() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  services.init();
}
