import 'package:flutter/material.dart';

class ShoppingCategory extends StatelessWidget {
  final Function(int) onCategoryTapped;
  final int selectedCategoryIndex;

  ShoppingCategory({required this.onCategoryTapped, required this.selectedCategoryIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(onPressed: () => onCategoryTapped(0), child: Text('친환경')),
            TextButton(onPressed: () => onCategoryTapped(1), child: Text('랭킹')),
            TextButton(onPressed: () => onCategoryTapped(2), child: Text('신상품')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8.0, // Chip 간의 수평 간격
            runSpacing: 4.0, // Chip 간의 수직 간격
            children: [
              ChoiceChip(label: Text('비누'), selected: false),
              ChoiceChip(label: Text('텀블러'), selected: false),
              ChoiceChip(label: Text('수세미'), selected: false),
              ChoiceChip(label: Text('바구니'), selected: false),
              ChoiceChip(label: Text('치약'), selected: false),
              ChoiceChip(label: Text('팩'), selected: false),
              ChoiceChip(label: Text('에코백'), selected: false),
            ],
          ),
        ),
      ],
    );
  }
}
