import 'package:flutter/material.dart';
import 'package:instagram_clone/styles/assets.dart';

class FeedContent extends StatelessWidget {
  const FeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      Assets.demoUserImage,
    );
  }
}
