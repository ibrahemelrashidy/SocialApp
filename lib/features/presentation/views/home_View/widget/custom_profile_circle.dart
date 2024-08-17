import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard(
      {super.key,
      required this.profImage,
      required this.userName,
      required this.email});
  final String profImage;
  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(profImage),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
