import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/provider/MYPROVIDER.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Login Screen/Login Screen.dart';
import 'Screens/Login Screen/forget_password.dart';
import 'Screens/Login Screen/register.dart';
import 'Screens/create event/create event.dart';
import 'Screens/edit event.dart';
import 'Screens/event details.dart';
import 'Screens/introduction screen.dart';
import 'Screens/onboarding screens.dart';
import 'firebase_manager/firebase_options.dart';
import 'home/home.dart';
import 'theme/dark theme.dart';
import 'theme/light themw.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);

    return true;
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provier = Provider.of<MyProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    BaseTheme theme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: theme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provier.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: userProvider.firebaseUser != null
          ? HomeScreen.routeName
          : IntroductionScreen.routeName,
      routes: {
        IntroductionScreen.routeName: (context) =>  IntroductionScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddEventsScreen.routeName: (context) => AddEventsScreen(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        EventDetailsScreen.routeName: (context) => EventDetailsScreen(),
        EditEventScreen.routeName: (context) => EditEventScreen(),
        Onboarding.routeName: (context) => Onboarding(),
      },
    );
  }
}
