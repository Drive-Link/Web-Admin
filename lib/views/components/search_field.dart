
import 'package:drivelink_admin/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          helperStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),fontSize: 15,
          ),
          fillColor: customTextFieldColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          ),
          prefixIcon: Icon(Icons.search,color: textColor.withOpacity(0.5),)
      ),
    );
  }
}