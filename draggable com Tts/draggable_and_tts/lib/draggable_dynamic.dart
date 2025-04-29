import 'package:flutter/material.dart';

class DraggableDynamic extends StatefulWidget {
  const DraggableDynamic({super.key});

  @override
  State<DraggableDynamic> createState() => _DraggableDynamicState();
}

class _DraggableDynamicState extends State<DraggableDynamic> {
  double x = 10;
  double y = 10;
  double dx = 200;
  double dy = 300;
  Color color = Colors.orange;
  Color colorAccepted = Colors.blue;
  bool hidden = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable dynamic'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: x,
            top: y,
            child: Opacity(
              opacity: hidden ? 0 : 1,
              child: Draggable<Color>(
                data: color,
                feedback: Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.orange),
                ),
                // childWhenDragging: Container(
                //   width: 90,
                //   height: 40,
                //   decoration: BoxDecoration(color: Colors.orange),
                // ),
                child: Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.orange),
                ),
                onDragUpdate: (details) {
                  setState(() {
                    x += details.delta.dx;
                    y += details.delta.dy;
                  });
                },
              ),
            ),
          ),
          Positioned(
            left: dx,
            top: dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  dx += details.delta.dx;
                  dy += details.delta.dy;
                });
              },
              child: DragTarget<Color>(
                builder: (context, accepted, rejected) {
                  return Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(color: colorAccepted),
                    child: Center(child: Text('?')),
                  );
                },
                onAcceptWithDetails: (details) {
                  setState(() {
                    hidden = true;
                    colorAccepted = details.data;
                  });
                  print(details.data);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
