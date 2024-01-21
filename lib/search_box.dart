import 'package:flutter/material.dart';
import 'constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(color: lightTextColor, fontSize: size.width > 600 ? 25.0 : 14.0),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(Icons.search, color: lightTextColor,size: size.width > 600 ? 38 : 25),
          hintText: 'Search by cinnamon name',
          hintStyle: const TextStyle(color: lightTextColor),
        ),
      ),
    );
  }
}
