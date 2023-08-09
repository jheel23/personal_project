import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_project_one/providers/task_provider.dart';
import 'package:personal_project_one/ui%20Elements/custom_clipper.dart';

class CustomShowDialog extends ConsumerWidget {
  const CustomShowDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(taskProvider);
    final task = ref.read(taskProvider);
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 400,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: 120,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                        ,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
