import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String? userName;

  const HomePage({
    super.key,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              userName ?? 'Carlos H.',
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
