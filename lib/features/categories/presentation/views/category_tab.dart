import 'package:flutter/material.dart';
import 'package:news_app/features/categories/presentation/data/models/category_model.dart';
import 'package:news_app/features/categories/presentation/views/widgets/category_item.dart';

class CategoryTab extends StatelessWidget {
  CategoryTab({required this.onClick, super.key});

  var category = CategoryModel.getCategories();
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Pick your category of interest",
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              itemCount: category.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onClick(category[index]);
                  },
                  child: CategoryItem(
                    categoryIModel: category[index],
                    isOdd: index.isOdd,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
