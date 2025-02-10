import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'Login Screen/Login Screen.dart';
class Onboarding extends StatelessWidget {
  static const String routeName="Onboarding";
  const Onboarding({super.key});
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }
  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle:Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).primaryColor),
      bodyTextStyle: Theme.of(context).textTheme.bodyMedium!..copyWith(
          color: Theme.of(context).primaryColor),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Theme.of(context).scaffoldBackgroundColor,
      imagePadding: EdgeInsets.only(top:243, ),
      imageFlex: 4,
    );
    return IntroductionScreen(
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
          color: Colors.white,
          activeColor:  Color.fromRGBO(86, 105, 255, 1) ),
      globalBackgroundColor:Theme.of(context).scaffoldBackgroundColor,
      allowImplicitScrolling: true,
      autoScrollDuration: 10000,
      infiniteAutoScroll: true,


      onDone: () {
        Navigator.pushNamed(context,LoginScreen.routeName);
      },
      done: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(25)
          ,border: Border.all(width: 1,color: Color.fromRGBO(86, 105, 255, 1))),
          child: Icon(Icons.arrow_forward_rounded,color: Color.fromRGBO(86, 105, 255, 1)  ,)),
     

      showDoneButton: true,
      showNextButton: true,
      next: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(25)
          ,border: Border.all(width: 1,color: Color.fromRGBO(86, 105, 255, 1))),
          child: Icon(Icons.arrow_forward_rounded,color: Color.fromRGBO(86, 105, 255, 1)  ,)),
      back: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(25)
          ,border: Border.all(width: 1,color: Color.fromRGBO(86, 105, 255, 1))),
        child: Icon(Icons.arrow_back,color: Color.fromRGBO(86, 105, 255, 1)  ,)),
      showBackButton: true,

      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top:20,bottom:10),
            child: _buildImage("E_Header.png",),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "title_onboarding2".tr(),
          body:"body_onboarding2".tr(),
          image: _buildImage("Frame2.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "title_onboarding2".tr(),
          body: "body_onboarding2".tr(), image: _buildImage('Frame1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "title_onboarding2".tr(),
          body: "body_onboarding2".tr(), image: _buildImage('Frame3.png'),
          decoration: pageDecoration,
        ),
      ],

    );

  }
}
