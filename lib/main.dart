import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gces_social/app/constants.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_controller.dart';
import 'app/app_repository.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    GcesSocial(sharedPrefs),
  );
}

class GcesSocial extends StatelessWidget {
  const GcesSocial(this.sharedPrefs, {Key? key}) : super(key: key);
  final SharedPreferences sharedPrefs;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: "GCES Social",
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              elevation: 1,
              color: kGreenishBlue)),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => AppRepository(Dio(), sharedPrefs));
        Get.put(AppController(), permanent: true);
      }),
    );
  }
}
