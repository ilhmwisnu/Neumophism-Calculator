import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Provider/app_color.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final buttonWidth = (MediaQuery.of(context).size.width - 16 * 5) * (1 / 4);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colorss.primaryColor,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: screen.width - 16 * 2,
                  height: screen.height -
                      16 * 6 -
                      buttonWidth * 5 -
                      24 -
                      MediaQuery.of(context).padding.top,
                  alignment: Alignment.bottomRight,
                  color: Colors.amber,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("tes", style: TextStyle(fontSize: 32)),
                        Text("Hasil", style: TextStyle(fontSize: 40)),
                      ],
                    ),
                  )),
              SizedBox(
                height: 24,
              ),
              Keyboard()
            ],
          ),
        ),
      ),
    );
  }

  Widget Keyboard() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonWidth = (constraints.maxWidth - 16 * 3) / 4;
        return Container(
          height: buttonWidth * 5 + 16 * 4,
          child: Row(
            children: [
              Container(
                color: Colors.blue,
                width: buttonWidth * 3 + 16 * 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                        Button(),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(flex: 2, child: Button()),
                        SizedBox(width: 16),
                        Button(),
                        SizedBox(width: 16),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                width: buttonWidth,
                child: Column(
                  children: [
                    Button(),
                    SizedBox(height: 16),
                    Expanded(child: Button()),
                    SizedBox(height: 16),
                    Expanded(child: Button()),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class Button extends StatelessWidget {
  final String child;
  const Button({this.child = ' '});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colorss.primaryColor),
      alignment: Alignment.center,
      width: (MediaQuery.of(context).size.width - 16 * 5) * (1 / 4),
      height: (MediaQuery.of(context).size.width - 16 * 5) * (1 / 4),
      // color: Colors.amber,
      child: Text(child),
    );
  }
}
