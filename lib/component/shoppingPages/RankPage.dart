import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int _selectedChipIndex = -1; // 선택된 Chip의 인덱스 (-1은 선택되지 않음을 의미)

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8.0, // Chip 간의 수평 간격
          runSpacing: 4.0, // Chip 간의 수직 간격
          children: List<Widget>.generate(choices.length, (int index) {
            return ChoiceChip(
              label: Text(choices[index]),
              selected: _selectedChipIndex == index,
              selectedColor: Colors.green[100],
              onSelected: (bool selected) {
                setState(() {
                  _selectedChipIndex = selected ? index : -1;
                });
              },
            );
          }).toList(),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                color: Colors.green[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://via.placeholder.com/100',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '랭킹 상품 ${index + 1}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '₩10,000',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
  final List<String> choices = <String>[
    '비누',
    '텀블러',
    '수세미',
    '바구니',
    '치약',
    '팩',
    '에코백',
  ];
}
