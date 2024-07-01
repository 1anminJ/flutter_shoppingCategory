import 'package:flutter/material.dart';

class EcoFriendlyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      '친환경 상품 ${index + 1}',
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
}
