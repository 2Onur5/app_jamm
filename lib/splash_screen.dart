import 'package:app_jamm/viewmodel.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Widget> futureCall() async {
    // do async operation ( api call, auto login)
    return Future.value(const CheckBoxUse());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/logo.png"),
      logoWidth: 150,
      title: const Text(
        "Akademi Görev Hatırlatıcı",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: const Text("Yükleniyor.."),
      navigator: const CheckBoxUse(),
      durationInSeconds: 3,
      );
  }
}
