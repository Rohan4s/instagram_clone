import 'package:flutter/material.dart';

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
  int index = 0;
  double _posX = 0;

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
    _controller.value = 0;
    print('Posx: $_posX');
    return Stack(
      children: [
        ..._backgroundContents(maxWidth),
        _foregroundContent(maxWidth),
      ],
    );
  }

  Widget _positioned(Widget child, double offset) {
    return Transform(
      transform: Matrix4.identity()..translate(offset),
      child: child,
    );
  }

  List<Widget> _backgroundContents(double maxWidth) {
    List<Widget> contents = [];
    for (int i = 0; i < widget.length; i++) {
      if (i - index <= 1 && i - index >= -1) {
        continue;
      } else if (i > index) {
        contents.add(_positioned(_content(i), maxWidth));
      } else if (i < index) {
        contents.add(_positioned(_content(i), -maxWidth));
      }
    }
    return contents.reversed.toList();
  }

  Widget _foregroundContent(double maxWidth) {
    List<Widget> contents = [];
    int start, cnt;
    if (index == 0) {
      start = 0;
      cnt = 2;
    } else {
      start = index - 1;
      cnt = 3;
    }
    for (int i = start; i < start + cnt; i++) {
      contents.add(_positioned(_content(i), (i - index) * maxWidth));
    }

    print('Foreground: $index');
    return GestureDetector(
      onPanStart: (details) => _posX = 0,
      onPanUpdate: (details) {
        final dx = details.delta.dx / maxWidth;
        print(dx + _controller.value);
        if (index == 0 && _controller.value + dx > 0) {
          return;
        }
        if (index == widget.length - 1 && _controller.value + dx < 0) {
          return;
        }
        setState(() {
          _posX += dx;
        });
      },
      onPanEnd: (details) {
        if (_posX > 0.5) {
          _posX += 1;
          setState(() {
            index++;
          });
        } else if (_posX < -0.5) {
          _posX -= 1;
          setState(() {
            index--;
          });
        } else {
          _posX = 0;
        }
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        transform: Matrix4.identity()..translate(_posX, 0),
        child: _content(index),
      ),
      // child: AnimatedBuilder(
      //   animation: _controller,
      //   builder: (context, child) {
      //     return Transform(
      //       transform: Matrix4.identity()
      //         ..translate(_controller.value * maxWidth),
      //       child: child,
      //     );
      //   },
      //   child: _content(index),
      // ),
    );
  }

  Widget _content(int index) {
    print('Index: $index');
    return Container(
      width: double.infinity,
      height: 200,
      color: index % 2 == 1 ? Colors.blue : Colors.red,
      child: Center(child: Text('Index: $index')),
    );
  }
}
