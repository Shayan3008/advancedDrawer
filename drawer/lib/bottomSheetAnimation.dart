import 'package:flutter/material.dart';

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
        seconds: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (ctx, _) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                controller.isDismissed
                    ? controller.forward()
                    : controller.reverse();
              },
              child: Container(
                color: Colors.blue,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ((MediaQuery.of(context).size.height / 2) *
                    controller.value),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
