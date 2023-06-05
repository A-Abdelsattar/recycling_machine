import 'package:flutter/material.dart';
import 'package:recycling_machine/constants/assets.dart';
import 'package:recycling_machine/views/register_view.dart';



class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
          () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RegisterView()),
        );
      },
    );
    return Scaffold(
      body: Center(
        child:
            Image.asset(logo),

      ),

    );

  }

}
