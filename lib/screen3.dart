import 'package:flutter/material.dart';

import 'routes.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Screen3'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.screen4);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
