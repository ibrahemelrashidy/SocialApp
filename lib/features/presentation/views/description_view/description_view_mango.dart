import 'package:flutter/material.dart';
import 'package:socialapp/features/presentation/views/description_view/widgets/description_view_body_mango.dart';

class DescriptionViewMango extends StatelessWidget {
  const DescriptionViewMango({super.key});

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
      body: DescriptionViewBodyMango(),
    );
  }
}
