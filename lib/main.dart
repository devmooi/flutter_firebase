import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // 로그인 페이지를 import 해줍니다.
import 'pages/home_page.dart'; // 홈 페이지를 import 해줍니다.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // 초기 경로를 설정합니다.
      routes: {
        '/': (context) => LoginPage(), // 초기 경로는 로그인 페이지로 설정합니다.
        '/login': (context) => LoginPage(), // '/login' 경로를 로그인 페이지로 설정합니다.
        '/home': (context) => HomePage(), // '/home' 경로를 홈 페이지로 설정합니다.
      },
    );
  }
}
