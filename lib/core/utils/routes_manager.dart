// import 'package:flutter/material.dart';
// import 'package:flutter_advanced/presentation/forget_password/forget_password_view.dart';
// import 'package:flutter_advanced/presentation/login/login_view.dart';
// import 'package:flutter_advanced/presentation/main/main_view.dart';
// import 'package:flutter_advanced/presentation/onboarding/onboarding_view.dart';
// import 'package:flutter_advanced/presentation/register/register_view.dart';
// import 'package:flutter_advanced/presentation/resources/strings_manager.dart';
// import 'package:flutter_advanced/presentation/spalsh/spalsh_view.dart';
// import 'package:flutter_advanced/presentation/store_details/store_details_view.dart';

// class Routes {
//   static const String spalshRoute = '/';
//   static const String loginRoute = '/login';
//   static const String registerRoute = '/register';
//   static const String forgetPasswordRoute = '/forgetPassword';
//   static const String onBoardingRoute = '/onBoarding';
//   static const String mainRoute = '/main';
//   static const String storeDetailsRoute = '/storeDetails';
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.spalshRoute:
//         return MaterialPageRoute(builder: (_) => const SplashView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => const LoginView());
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_) => const RegiserView());
//       case Routes.forgetPasswordRoute:
//         return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
//       case Routes.onBoardingRoute:
//         return MaterialPageRoute(builder: (_) => const OnBoardingView());
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_) => const MainView());
//       case Routes.storeDetailsRoute:
//         return MaterialPageRoute(builder: (_) => const StorDetailsView());
//       default:
//         return unDefinedRoute();
//     }
//   }

//   static unDefinedRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(
//                 title: const Text(StringsManager.noRoutaFound),
//               ),
//               body: const Center(child: Text(StringsManager.noRoutaFound)),
//             ));
//   }
// }
