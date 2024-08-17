import 'package:flutter/material.dart';
import 'package:socialapp/core/utils/sq_lite_helper.dart';
import 'package:socialapp/features/presentation/views/description_view/description_view_mango.dart';
import 'package:socialapp/features/presentation/views/description_view/description_view_maple.dart';
import 'package:socialapp/features/presentation/views/description_view/description_view_oak.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/custom_card.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/custom_profile_circle.dart';

class HomeViewbody extends StatefulWidget {
  const HomeViewbody({super.key});

  @override
  _HomeViewbodyState createState() => _HomeViewbodyState();
}

class _HomeViewbodyState extends State<HomeViewbody> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  int _mapleHeartCount = 123;
  int _mapleEyeCount = 456;
  int _oakHeartCount = 321;
  int _oakEyeCount = 654;
  int _mangoHeartCount = 123;
  int _mangoEyeCount = 456;

  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  void _loadCounts() async {
    int mapleHeart = await _dbHelper.getCount(1);
    int mapleEye = await _dbHelper.getCount(2);
    int oakHeart = await _dbHelper.getCount(3);
    int oakEye = await _dbHelper.getCount(4);
    int mangoHeart = await _dbHelper.getCount(5);
    int mangoEye = await _dbHelper.getCount(6);

    setState(() {
      _mapleHeartCount = mapleHeart;
      _mapleEyeCount = mapleEye;
      _oakHeartCount = oakHeart;
      _oakEyeCount = oakEye;
      _mangoHeartCount = mangoHeart;
      _mangoEyeCount = mangoEye;
    });
  }

  void _incrementCount(int buttonId) async {
    await _dbHelper.incrementCount(buttonId);
    _loadCounts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTreeSection(
          context,
          'Maple trees',
          'An in-depth study on maple trees',
          'assets/images/mapletrees.jpg',
          'Wednesday, November 27, 2024',
          1, // Maple Heart Icon ID
          _mapleHeartCount,
          2, // Maple Eye Icon ID
          _mapleEyeCount,
          'assets/images/images.png',
          'Ahmed',
          'Ahmed@gmail.com',
          DescriptionViewMaple(),
        ),
        const SizedBox(height: 10),
        _buildTreeSection(
          context,
          'Oak Trees',
          'Preaching about oak trees',
          'assets/images/oaktrees.jpg',
          'Thursday, January 25, 2001',
          3, // Oak Heart Icon ID
          _oakHeartCount,
          4, // Oak Eye Icon ID
          _oakEyeCount,
          'assets/images/john.png',
          'John',
          'John@gmail.com',
          DescriptionViewoak(),
        ),
        const SizedBox(height: 10),
        _buildTreeSection(
          context,
          'Mango trees',
          'Give shadow and fruit, Absolute win, no?',
          'assets/images/mango.png',
          'Saturday, October 17, 2015',
          5, // Mango Heart Icon ID
          _mangoHeartCount,
          6, // Mango Eye Icon ID
          _mangoEyeCount,
          'assets/images/mohamed.png',
          'Mohamed',
          'Mohamed@gmail.com',
          DescriptionViewMango(),
        ),
      ],
    );
  }

  Widget _buildTreeSection(
    BuildContext context,
    String title,
    String subtitle,
    String image,
    String date,
    int heartButtonId,
    int heartCount,
    int eyeButtonId,
    int eyeCount,
    String profImage,
    String userName,
    String email,
    Widget descriptionView,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return descriptionView;
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 234, 234),
            borderRadius: BorderRadiusDirectional.circular(18),
          ),
          child: Column(
            children: [
              CustomCard(
                image: image,
                subTitle: subtitle,
                title: title,
                date: date,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomProfileCard(
                    profImage: profImage,
                    userName: userName,
                    email: email,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _incrementCount(heartButtonId),
                        child: Column(
                          children: [
                            Icon(color: Colors.red, Icons.favorite),
                            Text('$heartCount'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => _incrementCount(eyeButtonId),
                        child: Column(
                          children: [
                            Icon(color: Colors.green, Icons.remove_red_eye),
                            Text('$eyeCount'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
