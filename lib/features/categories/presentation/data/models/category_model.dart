import 'dart:ui';

import 'package:news_app/generated/assets.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "business",
          name: "Business",
          image: Assets.imagesBussines,
          color: const Color(0xFFCF7E48)),
      CategoryModel(
          id: "entertainment",
          name: "Entertainment",
          image: Assets.imagesEnvironment,
          color: const Color(0xFF4882CF)),
      CategoryModel(
          id: "general",
          name: "General",
          image: Assets.imagesPolitics,
          color: const Color(0xFF003E90)),
      CategoryModel(
          id: "health",
          name: "Health",
          image: Assets.imagesHealth,
          color: const Color(0xFFED1E79)),
      CategoryModel(
          id: "science",
          name: "Science",
          image: Assets.imagesScience,
          color: const Color(0xFFF2D352)),
      CategoryModel(
          id: "sports",
          name: "Sports",
          image: Assets.imagesBall,
          color: const Color(0xFFC91C22)),
      CategoryModel(
          id: "technology",
          name: "Technology",
          image: Assets.imagesEnvironment,
          color: const Color(0xFF2082CE)),
    ];
  }
}
