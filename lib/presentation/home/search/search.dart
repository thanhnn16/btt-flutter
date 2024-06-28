import 'package:bongtuyettrang/presentation/widgets/commons/button.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Button(
          onPressed: () {
            Navigator.pop(context);
          },
          label: 'Search',
        ),
      ),
    );
  }
}
