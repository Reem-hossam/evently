
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Screens/onboarding%20screens.dart';
import 'package:evently/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../provider/MYPROVIDER.dart';
import 'Login Screen/Login Screen.dart';

class LetsGo extends StatelessWidget {
  static const String routeName="LetsGo";
  const LetsGo({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/E_Header.png",
          height: 50,
          width: 159,
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset("assets/images/intro_image.png",
              height:361,
              width:361,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            context.tr('introduction_title'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
         color: Theme.of(context).primaryColor),
          ),

          const SizedBox(height: 28,),

          Text("introduction_desc".tr(),
          style: Theme.of(context).textTheme.titleSmall,),
          const SizedBox(
          height: 28,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("language".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor)),
              ToggleSwitch(
                minWidth: 73.0,
                minHeight: 30.0,
                initialLabelIndex: context.locale.toString() == "en" ? 0 : 1,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                icons: [
                  FontAwesomeIcons.flagUsa,
                  MdiIcons.abjadArabic,
                ],
                iconSize: 30.0,
                activeBgColors: [
                  context.locale.toString() == "en"
                      ? [
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor
                  ]
                      : [Colors.yellow, Colors.orange],
                  context.locale.toString() != "en"
                      ? [
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor
                  ]
                      : [Colors.yellow, Colors.orange],
                ],
                animate: true,
                // with just animate set to true, default curve = Curves.easeIn
                curve: Curves.bounceInOut,
                // animate must be set to true when using custom curve
                onToggle: (index) {
                  if (index == 0) {
                    context.setLocale(Locale('en'));
                  } else {
                    context.setLocale(Locale('ar'));
                  }

                  print('switched to: $index');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("theme".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor)),
              ToggleSwitch(
                minWidth: 73.0,
                minHeight: 30.0,
                initialLabelIndex:
                provider.themeMode == ThemeMode.light ? 0 : 1,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                icons: const [
                  FontAwesomeIcons.lightbulb,
                  FontAwesomeIcons.moon,
                ],
                iconSize: 30.0,

                activeBgColors: [
                  provider.themeMode == ThemeMode.light
                      ? [Colors.yellow, Colors.orange]
                      : [
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor
                  ],
                  provider.themeMode != ThemeMode.light
                      ? [Colors.yellow, Colors.orange]
                      : [
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor
                  ]
                ],
                animate: true,
                curve: Curves.bounceInOut,
                onToggle: (index) {
                  provider.changeTheme();
                  print('switched to: $index');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),


          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Onboarding.routeName);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
              child: Text("lets_start".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
