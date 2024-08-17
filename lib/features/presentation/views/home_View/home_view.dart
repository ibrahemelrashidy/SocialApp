import 'package:flutter/material.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
            child: Text(
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                'Leaf')),
      ),
      body: const HomeViewbody(),
    );
  }
}
