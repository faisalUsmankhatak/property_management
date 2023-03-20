import 'package:flutter/material.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(height: 80,width: 80,child: Text("Search")));
  }
}
