import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/features/splash/presentation/views/splash_view.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName:(context)=>const SplashView(),
        HomeView.routeName:(context)=>const HomeView(),
      },
    );
  }
}
