import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({required this.label, required this.onValueChanged, Key? key})
      : super(key: key);
  final String label;

  final ValueChanged<String> onValueChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onValueChanged,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
