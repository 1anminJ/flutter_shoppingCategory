import 'package:flutter/material.dart';

void showNotificationsDialog(BuildContext context) {
  final notifications = [
    '첫 번째 알림 제목',
    '두 번째 알림 제목',
    '세 번째 알림 제목',
  ];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '알림 목록',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/bell.png',
                      width: 24.0,
                      height: 24.0,
                      color: Colors.grey,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error); // 에러 발생 시 표시할 아이콘
                      },
                    ),
                    title: Text(
                      notifications[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
