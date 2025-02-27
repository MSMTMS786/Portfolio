import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String selectedCategory;

  const CategoryTabs({
    Key? key,
    required this.onCategorySelected,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Photos', 'Music', 'Videos'];
    final darkbrightness=Theme.of(context).brightness == Brightness.dark;
    

    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return GestureDetector(
            onTap: () => onCategorySelected(category),
            child: Column(
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: darkbrightness
                        ? (isSelected ? Colors.blue :  Colors.white)
                        : (isSelected ? Colors.blue : Colors.black),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                if (isSelected)
                  Container(
                    width: 20,
                    height: 2,
                    color: Colors.white,
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}