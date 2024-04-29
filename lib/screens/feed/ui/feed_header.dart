import 'package:flutter/material.dart';
import 'package:instagram_clone/styles/assets.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(Assets.demoUserImage),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Text(
              'Jessore, Khulna, Bangladesh',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
