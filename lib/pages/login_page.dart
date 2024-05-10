import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_page.dart';
import 'home_page.dart'; // 새로운 홈 화면을 import 합니다.

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // 로그인에 성공하면 홈 화면으로 이동합니다.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // 홈 화면으로 이동합니다.
      );
    } catch (e) {
      print('로그인 실패: $e');
      // 로그인 실패한 경우 사용자에게 적절한 메시지를 표시하거나 오류를 처리할 수 있습니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LOGO',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: '이메일')),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: '비밀번호'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signIn(context), // 로그인 기능 호출
                child: Text('로그인'),
              ),
              TextButton(
                onPressed: () {
                  // 회원가입 페이지로 이동합니다.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
