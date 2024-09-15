import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/bloc/cubit.dart';
import 'package:news_app/features/categories/presentation/data/models/category_model.dart';
import 'package:news_app/features/categories/presentation/views/category_tab.dart';
import 'package:news_app/features/home/presentation/views/widgets/drawer_widget.dart';
import 'package:news_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:news_app/features/search/presentation/views/search_view.dart';
import 'package:news_app/generated/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = "home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(Assets.imagesPattern),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          drawer:  DrawerWidget(onClick: onDrawerClicked,),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchView(),);
                },
                icon: const Icon(Icons.search_rounded),
              )
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
            toolbarHeight: 65,
            backgroundColor: Colors.green,
            title: Text(
              "News App",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            centerTitle: true,
          ),
          body: categoryModel == null
              ? CategoryTab(
                  onClick: onCategorySelected,
                )
              :  HomeViewBody(id: categoryModel!.id,)),
    ),
);
  }

  CategoryModel? categoryModel;

  onCategorySelected(cat) {
    categoryModel = cat;
    setState(() {});
  }

  onDrawerClicked(id){
    if(id ==DrawerWidget.category_id){
      categoryModel =null;
      Navigator.pop(context);
    }else if(id==DrawerWidget.settings_id){

    }
    setState(() {

    });
  }
}
