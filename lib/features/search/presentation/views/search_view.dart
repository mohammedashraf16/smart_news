import 'package:flutter/material.dart';
import 'package:news_app/features/search/presentation/views/widgets/build_search_data.dart';

class SearchView extends SearchDelegate {
  ThemeData appBarThemeData(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.white,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BuildSearchData(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BuildSearchData(query: query);
  }
}

