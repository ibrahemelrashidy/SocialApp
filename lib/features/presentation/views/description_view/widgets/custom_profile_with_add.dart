import 'package:flutter/material.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/custom_profile_circle.dart';

class CustomProfileWithAdd extends StatelessWidget {
  const CustomProfileWithAdd(
      {super.key,
      required this.image,
      required this.userName,
      required this.email,
      required this.comments});
  final String image;
  final String userName;
  final String email;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomProfileCard(
                profImage: image, userName: userName, email: email),
            const Icon(Icons.group_add_rounded),
          ],
        ),
        Text(comments),
        const Divider()
      ],
    );
  }
}
