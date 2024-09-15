import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/features/bloc/cubit.dart';
import 'package:news_app/features/bloc/states.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/tab_item.dart';

class HomeViewBody extends StatelessWidget {
  final String id;

  const HomeViewBody({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => HomeCubit()..getResponse(id),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is HomeGetSourcesLoadingState ||
                state is HomeGetNewsDataLoadingState) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is HomeGetNewsDataErrorState) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Error",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.red),
                    ),
                    content: const Text(
                        "Failed to load sources. Please try again later."),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Text("Ok"),
                      ),
                    ],
                  );
                },
              );
            }
            if (state is HomeChangeSource) {
              HomeCubit.get(context).getNewsData(
                  sourceId: HomeCubit.get(context)
                          .sourceResponse
                          ?.sources?[HomeCubit.get(context).selectedTapIndex]
                          .id ??
                      "");
            }
          },
          builder: (context, state) {
            if (state is HomeGetSourcesErrorState) {
              return const Text("Something went wrong!!");
            }
            return Column(children: [
              DefaultTabController(
                length:
                    HomeCubit.get(context).sourceResponse?.sources?.length ?? 0,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                      onTap: (value) {
                        HomeCubit.get(context).changeSource(value);
                      },
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      tabs: HomeCubit.get(context)
                              .sourceResponse
                              ?.sources
                              ?.map((e) => TabItem(
                                    isSelected: HomeCubit.get(context)
                                            .sourceResponse!
                                            .sources
                                            ?.elementAt(HomeCubit.get(context)
                                                .selectedTapIndex) ==
                                        e,
                                    source: e,
                                  ))
                              .toList() ??
                          [],
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: HomeCubit.get(context)
                          .newsDataResponse
                          ?.articles
                          ?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return NewsItem(
                      article: HomeCubit.get(context)
                          .newsDataResponse!
                          .articles![index],
                    );
                  },
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
