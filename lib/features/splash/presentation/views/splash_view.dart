import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/generated/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = "splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigationFun();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(Assets.imagesPattern),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                Assets.imagesLogo,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
  void navigationFun() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      },
    );
  }
}
