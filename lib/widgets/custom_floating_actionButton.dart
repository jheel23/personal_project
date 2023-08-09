// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:personal_project_one/screens/add_task_screen.dart';
import 'package:personal_project_one/screens/add_transaction_screen.dart';

bool toggle = false;

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  //
  //
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
        reverseDuration: const Duration(milliseconds: 270));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

//
//

  Alignment alignment1 = const Alignment(0.8, 0.9);
  Alignment alignment2 = const Alignment(0.8, 0.9);

  double size1 = 0;
  double size2 = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AnimatedAlign(
          duration: toggle
              ? const Duration(milliseconds: 300)
              : const Duration(milliseconds: 270),
          alignment: alignment1,
          curve: toggle ? Curves.easeIn : Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: toggle ? Curves.easeIn : Curves.easeOut,
            height: size1,
            width: size1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.blue),
            child: IconButton(
              tooltip: 'Add new Transactions',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const AddTransactionScreen();
                }));
              },
              color: Colors.white,
              icon: const Icon(Icons.list_rounded),
            ),
          ),
        ),
        size1 == 0
            ? const SizedBox()
            : const SizedBox(
                height: 10,
              ),
        AnimatedAlign(
          duration: toggle
              ? const Duration(milliseconds: 300)
              : const Duration(milliseconds: 270),
          alignment: alignment2,
          curve: toggle ? Curves.easeIn : Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: toggle ? Curves.easeIn : Curves.easeOut,
            height: size2,
            width: size2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.blue),
            child: IconButton(
              tooltip: 'Add new Tasks',
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const AddTaskScreen();
                }));
              },
              icon: const Icon(Icons.add_task_rounded),
            ),
          ),
        ),
        size1 == 0
            ? const SizedBox()
            : const SizedBox(
                height: 10,
              ),
        Transform.rotate(
          angle: _animation.value * pi * (3 / 4),
          child: AnimatedContainer(
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 300),
            height: toggle ? 70 : 60,
            width: toggle ? 70 : 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.blue[100],
            ),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                splashColor: Colors.blue,
                icon: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (toggle) {
                    toggle = !toggle;
                    _animationController.forward();
                    Future.delayed(const Duration(milliseconds: 10), () {
                      alignment1 = const Alignment(0.96, 0.6);
                      alignment2 = const Alignment(0.96, 0.8);
                      size1 = 50;
                      size2 = 50;
                    });
                  } else {
                    toggle = !toggle;
                    _animationController.reverse();
                    alignment1 = const Alignment(0.96, 0.95);
                    alignment2 = const Alignment(0.96, 0.95);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
