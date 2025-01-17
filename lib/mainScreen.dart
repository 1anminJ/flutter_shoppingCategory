import 'package:flutter/material.dart';
import 'component/shoppingPages/EcoFriendly.dart';
import 'component/shoppingPages/RankPage.dart';
import 'component/shoppingPages/NewProducts.dart';
import 'component/shoppingPages/shoppingCategory.dart';
import 'notifications.dart';
import 'search.dart';

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

  TextStyle _getCategoryTextStyle(int index) {
    return TextStyle(
      decoration: _selectedCategoryIndex == index ? TextDecoration.underline : TextDecoration.none,
    );
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
          child: GestureDetector(
            onTap: () => showNotificationsDialog(context),
            child: Image.asset(
              'assets/bell.png',
              width: 24.0,
              height: 24.0,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error); // 에러 발생 시 표시할 아이콘
              },
            ),
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
              onTap: () => showSearchDialog(context),
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