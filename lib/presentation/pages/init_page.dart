import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController groupController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    groupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              Text('안녕하세요', style: textTheme.displayLarge),
              const SizedBox(height: 8),
              Text('이름과 소속을 입력해주세요', style: textTheme.displaySmall),
              const SizedBox(height: 32),
              TextField(
                style: textTheme.bodySmall,
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                style: textTheme.bodySmall,
                controller: groupController,
                decoration: const InputDecoration(
                  labelText: '소속',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('시작하기'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
