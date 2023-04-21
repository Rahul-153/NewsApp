import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/news.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: 'Search...',
        // Add a clear button to the search bar
        suffixIcon: IconButton(
          icon: Icon(Icons.clear,color: Colors.black,),
          onPressed: () {
            _searchController.clear();
          },
        ),
        // Add a search icon or button to the search bar
        prefixIcon: IconButton(
          icon: Icon(Icons.search,color: Colors.black,),
          onPressed: () async{
            await Provider.of<News>(context,listen: false).changeQuery(_searchController.toString());
            await Provider.of<News>(context,listen: false).fetchAndSetQuery(_searchController.toString());
          },
        ),
      ),
    );
  }
}
