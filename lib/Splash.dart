import 'package:flutter/material.dart';
import 'package:location_app/gen/assets.gen.dart';
import 'package:location_app/main.dart';

class SplashScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Center(
            child: Assets.img.icons.logo.image(width: 160),
          ),
        ]),
      ),
    ));
  }
}
