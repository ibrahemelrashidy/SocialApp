import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialapp/features/presentation/views/description_view/widgets/Custom_comment_body.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/custom_profile_circle.dart';

class DescriptionViewBodyMango extends StatelessWidget {
  const DescriptionViewBodyMango({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
                width: double.infinity,
                height: 300,
                child:
                    Image.asset(fit: BoxFit.cover, 'assets/images/mango.png')),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'preaching about mango trees',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Thursday,March25,2001',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.green),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  'Oak trees are one of the most robust and large trees in the world, and they’ve been around for millions of years. Believe it or not, there are over 600 oak species, and approximately 100 grow in the United States. Aside from their ability to feed numerous creatures with their leaves and acorns, there are various reasons why oak trees are unique among trees.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomProfileCard(
                      profImage: 'assets/images/mohamed.png',
                      userName: "Mohamed",
                      email: "Mohamed@gmail.com"),
                  Icon(Icons.group_add_rounded)
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(color: Colors.red, Icons.favorite),
                  Text('131')
                ],
              ),
              Column(
                children: [
                  Icon(color: Colors.green, Icons.remove_red_eye),
                  Text('437')
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        CommentsButton()
      ],
    );
  }
}
