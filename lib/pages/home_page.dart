import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart'; // 로그인 페이지를 import 해줍니다.

class HomePage extends StatelessWidget {
  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // 로그아웃 후에는 로그인 페이지로 이동합니다.
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print('로그아웃 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
        actions: [
          // 로그아웃 버튼을 AppBar 오른쪽에 추가합니다.
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Text('로그인 성공! 홈 화면입니다.'),
      ),
    );
  }
}
