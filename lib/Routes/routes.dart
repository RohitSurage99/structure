
import 'package:dummy/Routes/routes_name.dart';
import 'package:dummy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';







class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => MyHomePage());

    // case RouteName.onBoarding:
    //   return const OnBoardingScreen();
    //
    // case RouteName.logIn:
    //   return LoginScreen();
    //
    // case RouteName.signUp:
    //   return const SignUpScreen();
    //
    // case RouteName.verificationCode:
    //   final args = settings.arguments as Map<String, dynamic>;
    //   return PVerificationCode(args: args);
    //
    // case RouteName.forgotPassword:
    //   return PageTransition(type: PageTransitionType.rightToLeft, child: const ForgotPassword());
    //
    // case RouteName.verificationCodeForForgotPassword:
    //   final args = settings.arguments as Map<String, dynamic>;
    //   return VerificationCodeForForgotPassword(args: args,);
    //
    // case RouteName.resetPassword:
    //   final args = settings.arguments as Map<String, dynamic>;
    //   return ResetPassword(args: args);
    //
    // case RouteName.bottomBarTabs:
    //   return MultiBlocProvider(providers: [
    //     BlocProvider(create: (BuildContext context) => GetUserDetailsCubit()),
    //     BlocProvider(create: (BuildContext context) => CancelledOrdersCubit()),
    //     BlocProvider(create: (BuildContext context) => CompleteOrdersCubit()),
    //     BlocProvider(create: (BuildContext context) => SearchCubit()),
    //   ],
    //       child: const BottomBarTabs());


      default:
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
    }
  }
}






class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found'),
      ),
      body: Center(
        child: Text('404 - Page Not Found'),
      ),
    );
  }
}