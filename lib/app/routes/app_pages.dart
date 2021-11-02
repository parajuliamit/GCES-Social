import 'package:get/get.dart';

import 'package:gces_social/app/modules/home/bindings/home_binding.dart';
import 'package:gces_social/app/modules/home/views/home_view.dart';
import 'package:gces_social/app/modules/login_screen/bindings/login_screen_binding.dart';
import 'package:gces_social/app/modules/login_screen/views/login_screen_view.dart';
import 'package:gces_social/app/modules/logout/bindings/logout_binding.dart';
import 'package:gces_social/app/modules/logout/views/logout_view.dart';
import 'package:gces_social/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:gces_social/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:gces_social/app/modules/view_blog/bindings/view_blog_binding.dart';
import 'package:gces_social/app/modules/view_blog/views/view_blog_view.dart';
import 'package:gces_social/app/modules/write_blog/bindings/write_blog_binding.dart';
import 'package:gces_social/app/modules/write_blog/views/write_blog_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => LogoutView(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      transition: Transition.noTransition,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_BLOG,
      page: () => ViewBlogView(),
      binding: ViewBlogBinding(),
    ),
    GetPage(
      name: _Paths.WRITE_BLOG,
      page: () => WriteBlogView(),
      binding: WriteBlogBinding(),
    ),
  ];
}