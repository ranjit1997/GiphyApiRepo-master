import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

Future<Post> get fetchPost async {
  final response = await http.get(
     'https://jsonplaceholder.typicode.com/posts/1',
      //'https://api.giphy.com/v1/gifs/search?api_key= + "be429345554badb2aa499a8892cd3a30" + "&q=" + "cat" + "&limit=1"',
    headers: {HttpHeaders.authorizationHeader: "be429345554badb2aa499a8892cd3a30"},
  );

 if (response.statusCode == 200) {
    
   final responseJson = json.decode(response.body);
   print(responseJson.body);

  } else {
    
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      
      id: json['id'],
      title: json['title'],
      body: json['body'],);
}

}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 

  @override
  void initState() {
    super.initState();
    fetchPost;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
       ),
      );
  }
}


