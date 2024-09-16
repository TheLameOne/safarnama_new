import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safarnama/screens/splash_screen.dart';
import 'package:safarnama/utils/maps.dart';
import 'screens/auth/login_screen.dart';
import 'screens/package_overview_screen.dart';
import 'screens/packages.dart';
import 'screens/profile/refer_screen.dart';
import 'screens/tab_pages/booking_screen.dart';
import 'screens/tab_pages/favourite_screen.dart';
import 'screens/tab_pages/home_screen.dart';
import 'screens/tab_pages/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Safarnama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: SplashPage.routeNamed,
      routes: {
        LoginScreen.routeNamed: (BuildContext context) => const LoginScreen(),
        SplashPage.routeNamed: (BuildContext context) => const SplashPage(),
        HomeScreen.routeNamed: (BuildContext context) => const HomeScreen(),
        PackageOverviewScreen.routeNamed: (BuildContext context) =>
            PackageOverviewScreen(
              fav: true,
            ),
        // CheckoutScreen.routeNamed: (BuildContext context) => CheckoutScreen(),
        BookingScreen.routeNamed: (BuildContext context) =>
            const BookingScreen(),
        ProfileScreen.routeNamed: (BuildContext context) =>
            const ProfileScreen(),
        ReferScreen.routeNamed: (BuildContext context) => const ReferScreen(),
        FavouriteScreen.routeNamed: (BuildContext context) =>
            const FavouriteScreen(),
        PackagesScreen.routeNamed: (BuildContext context) =>
            const PackagesScreen(),
        GoogleMapsScreen.routeNamed: (BuildContext context) =>
            GoogleMapsScreen(),
      },
    );
  }
}
