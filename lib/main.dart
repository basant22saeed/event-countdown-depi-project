import 'package:event_countdown/screens/onBoarding%20Screens/onBoarding.dart';
import 'package:event_countdown/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //! نتحقق اذا كان المستخدم فتح التطبيق قبل كده ولا لا --  بسنت سعيد
  bool _seenOnboarding = false;

  @override
  void initState() {
    super.initState();
    _checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('seenOnboarding') ?? false;

    setState(() {
      _seenOnboarding = seen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SF",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          surface: const Color(0xffBFBFDB),
          primary: Color(0xff1A1A4B),
        ),
        useMaterial3: true,
      ),
      home: _seenOnboarding ? SplashScreen() : OnBoarding1(),
    );
  }
}
