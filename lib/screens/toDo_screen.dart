// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_project_one/providers/task_provider.dart';
import 'package:personal_project_one/widgets/custom_show_dialog.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(taskProvider);
    ref.read(taskProvider.notifier).fetchAndSetData();
    final tasksList = ref.read(taskProvider);
    return tasksList.isEmpty
        ? Center(
            child: Lottie.asset(
              'animations/1.json',
              height: 300,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover,
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (ctx, index) {
                    return Dismissible(
                      onDismissed: (direction) {
                        ref
                            .read(taskProvider.notifier)
                            .deleteTask(tasksList[index]);
                      },
                      key: ValueKey(index),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => const CustomShowDialog(),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FittedBox(
                                child: Text(tasksList[index].priority),
                              ),
                            ),
                          ),
                          title: Text(tasksList[index].title),
                          subtitle: Text(tasksList[index].description),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
