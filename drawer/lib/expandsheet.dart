import "package:flutter/material.dart";

class Animation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: 0.1,
          initialChildSize: 0.1,
          builder: (ctx, controller) => Container(
            color: Colors.blue,
            child: ListView.builder(
              controller: controller,
              itemBuilder: (ctx, index) => Text("Text No $index"),
              itemCount: 200,
            ),
          ),
        ),
      ),
    );
  }
}
