import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.source, required this.isSelected, super.key});

  Sources source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 3, color: Colors.green)),
      child: Text(
        source.name ?? "",
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
