import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  void _signUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // 회원가입이 성공한 경우 추가적인 사용자 정보를 설정하고 저장할 수 있습니다.
      // await userCredential.user
      // .updateProfile(displayName: _nameController.text);

      // 회원가입 성공 후 다음 작업을 수행할 수 있습니다.
      // 예를 들어, 다른 페이지로 이동하거나 사용자에게 환영 메시지를 표시할 수 있습니다.
    } catch (e) {
      print('회원가입 실패: $e');
      // 회원가입 실패한 경우 사용자에게 적절한 메시지를 표시하거나 오류를 처리할 수 있습니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: '이름'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: '이메일'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
