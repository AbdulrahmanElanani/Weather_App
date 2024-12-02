import 'package:flutter/material.dart';
import 'package:weather_app/widgets/search_view_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: const SearchViewWidget(),
    );
  }
}
