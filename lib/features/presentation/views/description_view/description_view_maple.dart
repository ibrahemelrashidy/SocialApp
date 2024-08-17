import 'package:flutter/material.dart';
import 'package:socialapp/features/presentation/views/description_view/widgets/DescriptionViewBodyMapple.dart';

class DescriptionViewMaple extends StatelessWidget {
  const DescriptionViewMaple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
            child: Text(
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                'Maple Trees')),
      ),
      body: DescriptionViewBodyMaple(),
    );
  }
}
