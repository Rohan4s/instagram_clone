import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/styles/assets.dart';

class FeedContent extends StatefulWidget {
  const FeedContent({
    super.key,
    this.length = 1,
  });

  final int length;

  @override
  State<FeedContent> createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final ValueNotifier<int> index = ValueNotifier<int>(0);

  // late final double maxWidth;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      lowerBound: -1,
      upperBound: 1,
      value: 0,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (index == 0 && details.delta.dx > 0) return;
        double dx = details.delta.dx;
        print(dx);
        _controller.value += dx / maxWidth;
      },
      onHorizontalDragEnd: (details) {
        if (_controller.value >= 0.5) {
          _controller.animateTo(1);
          index.value++;
        } else if (_controller.value <= -0.5) {
          _controller.animateTo(-1);
          index.value--;
        } else {
          _controller.animateTo(0);
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ValueListenableBuilder<int>(
            valueListenable: index,
            builder: (context, value, child) {
              return Stack(
                children: List.generate(
                  widget.length,
                  (cur) {
                    int curIndex = widget.length - 1 - cur;
                    print(curIndex);
                    if (curIndex == value) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..translate((_controller.value) * maxWidth),
                        child: Image.network(Assets.demoUserImage),
                      );
                    } else if (curIndex == value + 1) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..translate(
                              maxWidth + (_controller.value) * maxWidth),
                        child: Image.network(Assets.demoUserImage),
                      );
                    } else if (curIndex == value - 1) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..translate(
                              -maxWidth + (_controller.value) * maxWidth),
                        child: Image.network(
                          Assets.demoUserImage,
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
