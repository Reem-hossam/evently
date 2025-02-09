import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Screens/Login%20Screen/register.dart';
import 'package:evently/Screens/create%20event/create%20event.dart';
import 'package:evently/Screens/lets%20go%20screen.dart';
import 'package:evently/provider/MYPROVIDER.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/theme/light%20themw.dart';
import 'package:evently/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Login Screen/Login Screen.dart';
import 'Screens/Login Screen/forget_password.dart';
import 'Screens/edit event.dart';
import 'Screens/event details.dart';
import 'Screens/onboarding screens.dart';
import 'firebase_manager/firebase_options.dart';
import 'home/home.dart';
import 'theme/dark theme.dart';

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
    var provider=Provider.of<MyProvider>(context);
    BaseTheme lighttheme=LightTheme();
    BaseTheme darktheme=DarkTheme();

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      debugShowCheckedModeBanner: false,
        initialRoute:HomeScreen.routeName,
        darkTheme: darktheme.themeData,
        theme:lighttheme.themeData ,
        themeMode:provider.themeMode,
     // themeMode:ThemeMode.dark ,
        routes: {
        LetsGo.routeName:(context) => LetsGo(),
        Onboarding.routeName:(context) => Onboarding(),
        LoginScreen.routeName:(context) => LoginScreen(),
        ForgetPassword.routeName:(context) => ForgetPassword(),
        HomeScreen.routeName:(context) => HomeScreen(),
        CreateEvent.routeName:(context) => CreateEvent(),
        RegisterScreen .routeName:(context) => RegisterScreen(),
         EditEventScreen .routeName:(context) => EditEventScreen(),
         EventDetailsScreen.routeName:(context) => EventDetailsScreen(),
        }
    );
  }
}
