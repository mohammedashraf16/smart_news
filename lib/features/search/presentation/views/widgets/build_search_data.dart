import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/bloc/cubit.dart';
import 'package:news_app/features/bloc/states.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_item.dart';

class BuildSearchData extends StatelessWidget {
  const BuildSearchData({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getNewsData(query: query),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetNewsDataLoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeGetNewsDataErrorState) {
            const Center(
              child: Text("Something went wrong!!"),
            );
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount:
            HomeCubit.get(context).newsDataResponse?.articles?.length ?? 0,
            itemBuilder: (context, index) {
              return NewsItem(
                article:
                HomeCubit.get(context).newsDataResponse!.articles![index],
              );
            },
          );
        },
      ),
    );
  }
}
