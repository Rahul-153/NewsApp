import 'package:flutter/material.dart';

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
          onPressed: () {
            // Perform the search here
          },
        ),
      ),
    );
  }
}
