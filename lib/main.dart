import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // 장바구니 페이지를 기본 선택으로 설정

  static List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('홈')),
    Center(child: Text('피드')),
    PurchasePage(), // 장바구니 페이지
    Center(child: Text('유저 정보')),
    Center(child: Text('메뉴 페이지')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/bell.png'),
        ),
        title: Text('풀떼기'),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/home.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/feed.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/shopping.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/user.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/menu.png')),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,  // 선택된 아이템 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
        onTap: _onItemTapped,
      ),
    );
  }
}

class PurchasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(onPressed: () {}, child: Text('친환경')),
            TextButton(onPressed: () {}, child: Text('랭킹')),
            TextButton(onPressed: () {}, child: Text('신상품')),
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
                      '상품명 ${index + 1}',
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
