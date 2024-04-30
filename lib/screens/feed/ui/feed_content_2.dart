import 'package:flutter/material.dart';

class FeedContent2 extends StatefulWidget {
  const FeedContent2({super.key, this.length = 1});

  final int length;

  @override
  State<FeedContent2> createState() => _FeedContent2State();
}

class _FeedContent2State extends State<FeedContent2> {
  Offset pos = Offset.zero;
  bool isDragging = false;
  int topIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._backCards(topIndex),
        _frontCard(topIndex),
      ],
    );
  }

  List<Widget> _backCards(int topIndex) {
    List<Widget> cards = [];
    for (int i = 0; i < widget.length; i++) {
      if (i != topIndex) cards.add(_card(i));
    }
    return cards.reversed.toList();
  }


  Widget _frontCard(int topIndex) {
    return GestureDetector(
      onPanStart: (details) {
        isDragging = true;
        print('Pan Start');
      },
      onPanUpdate: (details) {
        if ((topIndex == 0 && details.delta.dx + pos.dx > 0) ||
            (topIndex == widget.length - 1 && details.delta.dx + pos.dx < 0)) {
          return;
        }
        pos += details.delta;
        setState(() {});
        // print('Pan Update');
      },
      onPanEnd: (details) {
        isDragging = false;
        pos = Offset.zero;
        setState(() {});
        print('Pan End');
      },
      child: Builder(
        builder: (context) {
          int duration = isDragging ? 0 : 300;
          return AnimatedContainer(
            duration: Duration(milliseconds: duration),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..translate(pos.dx, 0),
            child: _card(topIndex),
          );
        },
      ),
    );
  }

  Widget _frontCards(int topIndex) {
    return GestureDetector(
      onPanStart: (details) {
        isDragging = true;
        print('Pan Start');
      },
      onPanUpdate: (details) {
        if ((topIndex == 0 && details.delta.dx + pos.dx > 0) ||
            (topIndex == widget.length - 1 && details.delta.dx + pos.dx < 0)) {
          return;
        }
        pos += details.delta;
        setState(() {});
        // print('Pan Update');
      },
      onPanEnd: (details) {
        isDragging = false;
        pos = Offset.zero;
        setState(() {});
        print('Pan End');
      },
      child: Builder(
        builder: (context) {
          int duration = isDragging ? 0 : 300;
          return AnimatedContainer(
            duration: Duration(milliseconds: duration),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..translate(pos.dx, 0),
            child: _card(topIndex),
          );
        },
      ),
    );
  }

  Widget _card(int index) {
    return Container(
      color: index % 2 == 1 ? Colors.blue : Colors.red,
      height: 200,
      width: double.infinity,
      child: Center(
        child: Text('Card $index'),
      ),
    );
  }
}
