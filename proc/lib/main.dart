import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 226,
        ));
  }

  void toggle() =>
      !controller.isDismissed ? controller.reverse() : controller.forward();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    for (var i = 0; i < 5; i++) Text("$i",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(150 * controller.value)
                ..scale(1 - (controller.value * 0.3)),
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.yellow,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: toggle,
                    child: Icon(Icons.dehaze),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
