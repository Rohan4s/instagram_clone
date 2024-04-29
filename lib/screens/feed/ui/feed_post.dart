import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed/ui/feed_content.dart';
import 'package:instagram_clone/screens/feed/ui/feed_header.dart';
import 'package:instagram_clone/screens/feed/ui/feed_trailer.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeedHeader(),
        FeedContent(),
        FeedTrailer(),
      ],
    );
  }
}
