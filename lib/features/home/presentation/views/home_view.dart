import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = "home";

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
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
