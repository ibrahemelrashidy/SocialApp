import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/custom_profile_circle.dart';
import 'package:sqflite/sqflite.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchPostsFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts available'));
          } else {
            final posts = snapshot.data!;
            return Column(
              children: [
                Column(
                  children: posts.map((post) {
                    return Card(
                      color: Color.fromARGB(255, 247, 234, 234),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                                child: Image.asset(
                                  'assets/images/mango.png',
                                  height: 130,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                // This ensures that ListTile takes up the remaining space
                                child: ListTile(
                                  titleTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  title: Text(post['title']),
                                  subtitle: Text(post['content']),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 180),
                            child: Text(
                              'Wensday,November27,2024',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.green),
                            ),
                          ),
                          Divider(),
                          Row(
                            children: [
                              CustomProfileCard(
                                profImage: 'assets/images/images.png',
                                userName: 'elrahidy',
                                email: 'elrashidy@gmail.com',
                              ),
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Icon(color: Colors.red, Icons.favorite),
                                    Text('0')
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Icon(
                                        color: Colors.green,
                                        Icons.remove_red_eye),
                                    Text('0')
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
              ],
            );
          }
        },
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> _fetchPostsFromDatabase() async {
  Database database = await openDatabase('addPost.db');
  return await database.query('posts');
}
