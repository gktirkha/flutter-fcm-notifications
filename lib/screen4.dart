import 'package:flutter/material.dart';

import 'routes.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Screen4'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.home);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
