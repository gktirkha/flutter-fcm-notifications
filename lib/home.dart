import 'package:flutter/material.dart';

import 'routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.screen1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
