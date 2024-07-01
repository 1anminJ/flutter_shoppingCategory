import 'package:flutter/material.dart';

class ShoppingCategory extends StatelessWidget {
  final Function(int) onCategoryTapped;
  final int selectedCategoryIndex;

  ShoppingCategory({required this.onCategoryTapped, required this.selectedCategoryIndex});

  TextStyle _getCategoryTextStyle(int index) {
    return TextStyle(
      color: selectedCategoryIndex == index ? Colors.black : Colors.black54,
      decoration: selectedCategoryIndex == index ? TextDecoration.underline : TextDecoration.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () => onCategoryTapped(0),
          child: Text('친환경', style: _getCategoryTextStyle(0)),
        ),
        TextButton(
          onPressed: () => onCategoryTapped(1),
          child: Text('랭킹', style: _getCategoryTextStyle(1)),
        ),
        TextButton(
          onPressed: () => onCategoryTapped(2),
          child: Text('신상품', style: _getCategoryTextStyle(2)),
        ),
      ],
    );
  }
}
