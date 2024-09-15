import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/bloc/observer.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_details.dart';
import 'package:news_app/features/splash/presentation/views/splash_view.dart';
import 'package:news_app/theme/my_theme_date.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeDate.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        NewsDetails.routeName: (context) => const NewsDetails(),
        HomeView.routeName: (context) => const HomeView(),
      },
    );
  }
}
