import 'package:flutter/material.dart';
import 'package:socialapp/features/presentation/views/description_view/widgets/display_page.dart';
import 'package:socialapp/features/presentation/views/home_View/widget/home_view_body.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Database database;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  void createDatabase() async {
    database = await openDatabase(
      'addPost.db',
      version: 1,
      onCreate: (Database db, int version) async {
        print('create database');
        await db
            .execute(
          'CREATE TABLE posts (id INTEGER PRIMARY KEY, title TEXT, content TEXT)',
        )
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error when creating table: ${error.toString()}');
        });
      },
      onOpen: (Database db) {
        print('database opened');
      },
    );
  }

  void insertToDatabase(String title, String content) {
    database.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO posts (title, content) VALUES(?, ?)',
        [title, content],
      ).then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('Error when inserting into table: ${error.toString()}');
      });
    });
  }

  void _navigateToDisplayPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeViewbody(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
            child: Text(
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                'Add Post')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: 'Title'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: 'Content'),
              ),
              const SizedBox(height: 70),
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    String title = _titleController.text;
                    String content = _contentController.text;
                    insertToDatabase(title, content);
                    _navigateToDisplayPage(context);
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
