import 'package:flutter/material.dart';
import 'Photos.dart';

class PostDetailScreen extends StatelessWidget {
  final Photo post;
  const PostDetailScreen({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(post.title),
      ),
    );
  }
}
