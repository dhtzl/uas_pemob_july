import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uas_pemob/post.dart';
import 'package:uas_pemob/get.dart';
import 'package:uas_pemob/patch.dart';
import 'package:uas_pemob/delete.dart';
import 'package:uas_pemob/put.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HTTP Methods UAS PEMOB 2022 Daniel Hutajulu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('List View HTTP Methods UAS PEMOB'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('GET'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => metode_get(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('POST'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => metode_post(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('PATCH'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => metode_patch(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('PUT'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => metode_put(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('DELETE'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => metode_delete(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}