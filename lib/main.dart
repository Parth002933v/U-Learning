//to run flutter riverpod code generator we have to run code
// flutter pub run build_runner watch --delete-conflicting-outputs

// [log] Heigth 843.4285714285714
// [log] with 411.42857142857144

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

GlobalKey<NavigatorState> navkey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        navigatorKey: navkey,
        debugShowCheckedModeBanner: false,
        title: 'U Learning',
        theme: ThemeData.light(useMaterial3: false).copyWith(
          scaffoldBackgroundColor: AppColors.primarBackground,
          appBarTheme:
              const AppBarTheme(backgroundColor: AppColors.primarBackground),
        ),
        themeMode: ThemeMode.system,
        // initialRoute: "/welcome",
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
