import 'package:evently/Screens/Login%20Screen/forget_password.dart';
import 'package:evently/Screens/Login%20Screen/register.dart';
import 'package:flutter/material.dart%20';
import 'package:provider/provider.dart';

import '../../firebase_manager/fierbase_manager.dart';
import '../../home/home.dart';
import '../../provider/user_provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName="LoginScreen";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/Login_logo.png"),
            SizedBox(height: 24,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                hintText:"Email",),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: (){
                Navigator.pushNamed(context, ForgetPassword.routeName);
              },
                  child: Text(
                "Forget Password?",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              )
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(onPressed: (){
              FirebaseManager.login(
                emailController.text,
                passwordController.text,
                    () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Center(child: CircularProgressIndicator()),
                      backgroundColor: Colors.transparent,
                    ),
                  );
                },
                    () async {
                  Navigator.pop(context);
                  await userProvider.initUser();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeScreen.routeName,
                        (route) => false,
                  );
                },
                    (message) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: const Text("Something went Wrong"),
                      content: Text(message),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"))
                      ],
                    ),
                  );
                },
              );
            },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical:16,horizontal: 154),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
              child: Text("login",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don’t Have Account ?",
                      style:
                      Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: " Create Account",
                      style:
                      Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      indent: 10,
                      endIndent: 40,
                    )),
                Text(
                  textAlign: TextAlign.center,
                  "OR",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
                Expanded(
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      indent: 40,
                      endIndent: 10,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
