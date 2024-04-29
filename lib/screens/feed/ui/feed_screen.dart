import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed/ui/feed_post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
          FeedPost(),
        ],
      ),
    );
  }
}
