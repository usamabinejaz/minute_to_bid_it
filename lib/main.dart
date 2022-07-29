import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configuration/configure_non_web.dart' if (dart.library.html) '../configuration/configure_web.dart';
import 'util/core.dart';


void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => NavigationProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Minute to Bid it',
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        routeInformationParser: RoutesInformationParser(),
        routerDelegate: AppRouterDelegate(isLoggedIn: isLoggedIn),
      ),
    );
  }
}