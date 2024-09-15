import 'package:flutter/material.dart';
import 'package:news_app/features/categories/presentation/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.categoryIModel, required this.isOdd, super.key});

  CategoryModel categoryIModel;
  bool isOdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryIModel.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isOdd ? 0 : 16),
            bottomRight: Radius.circular(isOdd ? 16 : 0),
          )),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryIModel.image)),
          Text(
            categoryIModel.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                ),
          ),
        ],
      ),
    );
  }
}
