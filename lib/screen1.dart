import 'package:flutter/material.dart';

import 'routes.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Screen1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.screen2);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
