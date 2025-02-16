import 'package:dummy/Helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Helper/storage_helper.dart';
import 'Routes/routes.dart';
import 'Routes/routes_name.dart';
import 'Theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await mainCommon();
}

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage
  await StorageHelper().init();

  // Set status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorHelper.tpColor,
      statusBarBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // bool _isLightTheme = true;

  // void _toggleTheme() {
  //   setState(() {
  //     _isLightTheme = !_isLightTheme;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child:
      // MultiBlocProvider(
        // providers: [
          // Uncomment and implement your BlocProvider if needed
          // BlocProvider(create: (BuildContext context) => GetDefaultAddressCubit()),
        // ],
        // child:
      MaterialApp(
          title: "dummyapp",
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(false),
        darkTheme: AppTheme.theme(true),
        // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(
          //     background: ColorHelper.whiteColor,
          //     surface: ColorHelper.whiteColor,
          //     surfaceTint: ColorHelper.whiteColor,
          //     seedColor: ColorHelper.primaryColor,
          //   ),
          //   useMaterial3: true,
          // ),
        home: HomeScreen(
          toggleTheme: _toggleTheme,
          isLightTheme: _isLightTheme,
        ),
          // initialRoute: RouteName.splash,
          // onGenerateRoute: Routes.onGenerateRoute,
        ),
      );
    // );
  }
}


class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isLightTheme;

  const HomeScreen({required this.toggleTheme, required this.isLightTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Theme Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLightTheme ? 'Light Theme' : 'Dark Theme',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleTheme,
              child: Text("Toggle Theme"),
            ),
          ],
        ),
      ),
    );
  }
}

// flutter run --flavor dev -t lib/Flavor_Config/main_dev.dav