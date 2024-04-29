import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/styles/assets.dart';

class FeedTrailer extends StatelessWidget {
  const FeedTrailer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(0),
          onPressed: () {},
        ),
        InkWell(
          onTap: () {},
          customBorder: const CircleBorder(),
          child: SvgPicture.asset(
            Assets.commentIcon,
            height: 25,
            width: 20,
          ),
        ),
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () {},
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(0.15),
            child: SvgPicture.asset(
              Assets.sendIcon,
              height: 33,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.bookmark_outline),
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(0),
          onPressed: () {},
        ),
      ],
    );
  }
}
