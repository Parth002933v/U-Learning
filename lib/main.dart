//to run flutter riverpod code generator we have to run code
// flutter pub run build_runner watch --delete-conflicting-outputs

// [log] Heigth 843.4285714285714
// [log] with 411.42857142857144

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/firebase_options.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/sign_up/sign_up.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

Future<void> main() async {
  Global.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'U Learning',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/welcome",
        routes: {
          "/welcome": (context) => const Welcome(),
          "/signIn": (context) => const SignIn(),
          "/SignUp": (context) => const SignUp()
        },
      ),
    );
  }
}
