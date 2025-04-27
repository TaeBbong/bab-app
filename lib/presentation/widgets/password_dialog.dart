import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordDialog extends StatefulWidget {
  @override
  _PasswordDialogState createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  final TextEditingController _passwordController = TextEditingController();
  final String _correctPassword = '42849800';
  bool _isError = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword() {
    if (_passwordController.text == _correctPassword) {
      Get.back();
      Get.toNamed('/admin');
    } else {
      setState(() {
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('비밀번호 입력'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '비밀번호를 입력하세요',
              errorText: _isError ? '비밀번호가 틀렸습니다' : null,
            ),
            onSubmitted: (_) => _validatePassword(),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('취소')),
        TextButton(onPressed: _validatePassword, child: const Text('확인')),
      ],
    );
  }
}
