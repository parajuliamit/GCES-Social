import 'package:get/get.dart';

import 'package:gces_social/app/modules/assignment_screen/bindings/assignment_screen_binding.dart';
import 'package:gces_social/app/modules/assignment_screen/views/assignment_screen_view.dart';
import 'package:gces_social/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:gces_social/app/modules/change_password/views/change_password_view.dart';
import 'package:gces_social/app/modules/events/bindings/events_binding.dart';
import 'package:gces_social/app/modules/events/views/events_view.dart';
import 'package:gces_social/app/modules/home/bindings/home_binding.dart';
import 'package:gces_social/app/modules/home/views/home_view.dart';
import 'package:gces_social/app/modules/login_screen/bindings/login_screen_binding.dart';
import 'package:gces_social/app/modules/login_screen/views/login_screen_view.dart';
import 'package:gces_social/app/modules/logout/bindings/logout_binding.dart';
import 'package:gces_social/app/modules/logout/views/logout_view.dart';
import 'package:gces_social/app/modules/register/bindings/register_binding.dart';
import 'package:gces_social/app/modules/register/views/register_view.dart';
import 'package:gces_social/app/modules/routine_screen/bindings/routine_screen_binding.dart';
import 'package:gces_social/app/modules/routine_screen/views/routine_screen_view.dart';
import 'package:gces_social/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:gces_social/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:gces_social/app/modules/verify_screen/bindings/verify_screen_binding.dart';
import 'package:gces_social/app/modules/verify_screen/views/verify_screen_view.dart';
import 'package:gces_social/app/modules/view_assignment/bindings/view_assignment_binding.dart';
import 'package:gces_social/app/modules/view_assignment/views/view_assignment_view.dart';
import 'package:gces_social/app/modules/view_blog/bindings/view_blog_binding.dart';
import 'package:gces_social/app/modules/view_blog/views/view_blog_view.dart';
import 'package:gces_social/app/modules/write_blog/bindings/write_blog_binding.dart';
import 'package:gces_social/app/modules/write_blog/views/write_blog_view.dart';

// import 'package:gces_social/app/modules/attendance_screen/bindings/attendance_screen_binding.dart';
// import 'package:gces_social/app/modules/attendance_screen/views/attendance_screen_view.dart';

// import 'package:gces_social/app/modules/announcements/bindings/announcements_binding.dart';
// import 'package:gces_social/app/modules/announcements/views/announcements_view.dart';
// import 'package:gces_social/app/modules/chat_screen/bindings/chat_screen_binding.dart';
// import 'package:gces_social/app/modules/chat_screen/views/chat_screen_view.dart';

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
    // GetPage(
    //   name: _Paths.ANNOUNCEMENTS,
    //   page: () => AnnouncementsView(),
    //   binding: AnnouncementsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CHAT_SCREEN,
    //   page: () => ChatScreenView(),
    //   binding: ChatScreenBinding(),
    // ),
    GetPage(
      name: _Paths.ROUTINE_SCREEN,
      page: () => RoutineScreenView(),
      binding: RoutineScreenBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT_SCREEN,
      page: () => AssignmentScreenView(),
      binding: AssignmentScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.ATTENDANCE_SCREEN,
    //   page: () => AttendanceScreenView(),
    //   binding: AttendanceScreenBinding(),
    // ),
    GetPage(
      name: _Paths.VIEW_ASSIGNMENT,
      page: () => ViewAssignmentView(),
      transition: Transition.zoom,
      binding: ViewAssignmentBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      transition: Transition.leftToRight,
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_SCREEN,
      page: () => VerifyScreenView(),
      binding: VerifyScreenBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => EventsView(),
      binding: EventsBinding(),
    ),
  ];
}
