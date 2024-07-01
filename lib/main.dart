import 'package:flutter/material.dart';
import 'component/shoppingPages/EcoFriendly.dart';
import 'component/shoppingPages/RankPage.dart';
import 'component/shoppingPages/NewProducts.dart';
import 'component/shoppingPages/shoppingCategory.dart';

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
  int _selectedCategoryIndex = 0; // 기본 카테고리를 친환경으로 설정

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.5),
          insetPadding: EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: '검색어를 입력하세요',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _categoryOptions() {
    switch (_selectedCategoryIndex) {
      case 0:
        return EcoFriendlyPage();
      case 1:
        return RankingPage();
      case 2:
        return NewProductPage();
      default:
        return EcoFriendlyPage();
    }
  }

  List<Widget> _widgetOptions() {
    return <Widget>[
      Center(child: Text('홈')),
      Center(child: Text('피드')),
      Column(
        children: [
          ShoppingCategory(
            onCategoryTapped: _onCategoryTapped,
            selectedCategoryIndex: _selectedCategoryIndex,
          ),
          Expanded(
            child: _categoryOptions(),
          ),
        ],
      ),
      Center(child: Text('유저 정보')),
      Center(child: Text('메뉴 페이지')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/bell.png',
            width: 24.0,
            height: 24.0,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error); // 에러 발생 시 표시할 아이콘
            },
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('풀떼기'),
            SizedBox(width: 8), // 텍스트와 로고 사이의 간격
            Image.asset(
              'assets/logo.png',
              width: 24.0,
              height: 24.0,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error); // 에러 발생 시 표시할 아이콘
              },
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // 아이콘의 오른쪽 여백을 조정
            child: GestureDetector(
              onTap: _showSearchDialog,
              child: Icon(
                Icons.search,
                size: 30.0, // 아이콘 크기를 조정
              ),
            ),
          ),
        ],
      ),
      body: _widgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/home.png')),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/feed.png')),
            label: '피드',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/shopping.png')),
            label: '장바구니',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/user.png')),
            label: '유저 정보',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/menu.png')),
            label: '메뉴',
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
