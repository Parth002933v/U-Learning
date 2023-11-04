import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearning/common/services/storage.dart';
import 'package:ulearning/firebase_options.dart';

class Global {
  static late final StorageServices storageServices;

  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    storageServices = await StorageServices().init();
  }
}
