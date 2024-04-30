import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed/ui/feed_content.dart';
import 'package:instagram_clone/screens/feed/ui/feed_content_2.dart';
import 'package:instagram_clone/screens/feed/ui/feed_header.dart';
import 'package:instagram_clone/screens/feed/ui/feed_trailer.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({super.key, this.length = 1});

  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FeedHeader(),
        FeedContent2(length: length),
        const FeedTrailer(),
      ],
    );
  }
}
