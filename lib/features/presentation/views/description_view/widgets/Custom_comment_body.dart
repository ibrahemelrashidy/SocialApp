import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:socialapp/features/presentation/views/description_view/widgets/custom_profile_with_add.dart';

class CommentsButton extends StatefulWidget {
  @override
  _CommentsButtonState createState() => _CommentsButtonState();
}

class _CommentsButtonState extends State<CommentsButton> {
  final List<Widget> comments = [
    const CustomProfileWithAdd(
      image: 'assets/images/images.png',
      userName: 'Ahmed',
      email: 'Ahmed@gmail.com',
      comments: 'one of the most important groups of trees in forests',
    ),
    CustomProfileWithAdd(
      image: 'assets/images/john.png',
      userName: 'John',
      email: 'John@gmail.com',
      comments: 'They offer a great variety of form',
    ),
    CustomProfileWithAdd(
      image: 'assets/images/mohamed.png',
      userName: 'Mohamed',
      email: 'Ahmed@gmail.com',
      comments: ' for planting in lawns, along streets, and in parks.',
    ),
    CustomProfileWithAdd(
      image: 'assets/images/images.png',
      userName: 'Ahmed',
      email: 'Ahmed@gmail.com',
      comments: 'many display striking autumn colors.',
    ),
    CustomProfileWithAdd(
      image: 'assets/images/mohamed.png',
      userName: 'ALi',
      email: 'Ali@gmail.com',
      comments: 'one of the most important groups of trees in forests',
    ),
  ];

  bool showComments = false;

  void _toggleComments() {
    setState(() {
      showComments = !showComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: _toggleComments,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.comment),
                Text(
                  'Comments',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  comments.length.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          if (showComments)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: comments.map((comment) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: comment, // Display each widget directly
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
