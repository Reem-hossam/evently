import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Screens/create%20event/create%20event.dart';
import 'package:evently/Screens/lets%20go%20screen.dart';
import 'package:evently/provider/MYPROVIDER.dart';
import 'package:evently/theme/light%20themw.dart';
import 'package:evently/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Login Screen/Login Screen.dart';
import 'Screens/Login Screen/forget_password.dart';
import 'Screens/onboarding screens.dart';
import 'home/home.dart';
import 'theme/dark theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
    create:(context) =>MyProvider(),
    child: EasyLocalization(
        supportedLocales:
        [Locale('en'), Locale('ar')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  ),);
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
        }
    );
  }
}
