import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/app_color.dart';
import 'Provider/calculator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<Calc>(context);
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
                  // color: Colors.amber,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text((calc.getmath == '') ? "0" : calc.getmath,
                            style: TextStyle(
                                fontSize: 40, color: Colorss.textColor)),
                        Text(calc.getResult,
                            style:
                                TextStyle(fontSize: 56, color: Colors.black54)),
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
                width: buttonWidth * 3 + 16 * 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Button(
                          child: 'C',
                          color: Colorss.amberColor,
                        ),
                        Spacer(),
                        Button(
                          child: "%",
                          color: Colorss.blueColor,
                        ),
                        Spacer(),
                        Button(
                          child: "x",
                          color: Colorss.blueColor,
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Button(child: "7"),
                        Spacer(),
                        Button(
                          child: "8",
                        ),
                        Spacer(),
                        Button(
                          child: "9",
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Button(child: "4"),
                        Spacer(),
                        Button(child: "5"),
                        Spacer(),
                        Button(child: "6"),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          child: "3",
                        ),
                        Spacer(),
                        Button(child: "2"),
                        Spacer(),
                        Button(
                          child: "1",
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Button(
                              child: "0",
                            )),
                        SizedBox(width: 16),
                        Button(child: "."),
                        SizedBox(width: 16),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: buttonWidth,
                child: Column(
                  children: [
                    Button(
                      child: "-",
                      color: Colorss.blueColor,
                    ),
                    SizedBox(height: 16),
                    Expanded(
                        child: Button(
                      child: "+",
                      color: Colorss.blueColor,
                      isOuterShadow: false,
                    )),
                    SizedBox(height: 16),
                    Expanded(
                        child: Button(
                      child: "=",
                      color: Colorss.amberColor,
                      isOuterShadow: false,
                    )),
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
  Color? color;
  final String child;
  bool isOuterShadow;
  Button({this.child = ' ', this.isOuterShadow = true, this.color});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<Calc>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colorss.primaryColor,
          boxShadow: (isOuterShadow)
              ? [
                  BoxShadow(
                    blurRadius: 12,
                    offset: Offset(5, 5),
                    color: Color(0xff000000).withOpacity(0.1),
                  ),
                  BoxShadow(
                      blurRadius: 12,
                      offset: Offset(-5, -5),
                      color: Color(0xffffffff).withOpacity(0.66))
                ]
              : [],
          gradient: (!isOuterShadow)
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.01),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.7),
                    Colors.white.withOpacity(1),
                  ],
                  transform: GradientRotation(-0.5))
              : null),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            if (this.child == "C") {
              calc.restart();
            } else if (this.child == "=") {
              calc.calculate();
            } else {
              calc.setMath(child);
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: (MediaQuery.of(context).size.width - 16 * 5) * (1 / 4),
            height: (MediaQuery.of(context).size.width - 16 * 5) * (1 / 4),
            child: Text(child,
                style: TextStyle(
                    color: (color == null) ? Colorss.textColor : color,
                    fontSize: 40)),
          ),
        ),
      ),
    );
  }
}
