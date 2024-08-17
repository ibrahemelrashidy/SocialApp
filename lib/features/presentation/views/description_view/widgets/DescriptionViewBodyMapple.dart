import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialapp/features/presentation/views/description_view/widgets/Custom_comment_body.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/custom_profile_circle.dart';

class DescriptionViewBodyMaple extends StatelessWidget {
  const DescriptionViewBodyMaple({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                    fit: BoxFit.cover, 'assets/images/mapletrees.jpg')),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'An in-depth study on maple trees',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Wednesday,November27,2024',
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
                  'Maple is a species of trees known for its vibrant colors and distinct patterns. What makes this tree even more well known is its ability to produce a unique sap that can be turned into syrup. The sap from maple trees is significantly sweeter than the sap of any other tree. World wide, there are some 150 species of Maple, distributed throughout the Northern hemispheres\n Temperate Forest Zone About two_thirds of them are in Eastern Asia. Ten maple species are native to Canada lus the Freeman Maple which a naturally occuring hybrid.',
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
                      profImage: 'assets/images/images.png',
                      userName: "Ahmed",
                      email: "Ahmed@gmail.com"),
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
                  Text('123')
                ],
              ),
              Column(
                children: [
                  Icon(color: Colors.green, Icons.remove_red_eye),
                  Text('456')
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
