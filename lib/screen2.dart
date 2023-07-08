import 'package:flutter/material.dart';

import 'routes.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Screen2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.screen3);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
