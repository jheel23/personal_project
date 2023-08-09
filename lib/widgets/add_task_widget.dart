import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_project_one/models/task.dart';
import 'package:personal_project_one/providers/task_provider.dart';

class AddTaskWidget extends ConsumerStatefulWidget {
  const AddTaskWidget({super.key});

  @override
  ConsumerState<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends ConsumerState<AddTaskWidget> {
  final _keyforsubmit = GlobalKey<FormState>();
  bool ishard = false;
  bool ismedium = false;
  bool iseasy = false;

  final _newTask = TaskModel(id: '', title: '', description: '', priority: '');
  void _saveForm(String prioritylevel) {
    final isValid = _keyforsubmit.currentState!.validate();
    if (!isValid) {
      return;
    }
    _newTask.priority = prioritylevel;
    _keyforsubmit.currentState!.save(); //Saving the form
    ref.read(taskProvider.notifier).addTask(_newTask);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
              key: _keyforsubmit,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter a Task!';
                          }
                          return null;
                        },
                        onSaved: ((newValue) {
                          _newTask.title = newValue!;
                        }),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          labelText: 'Task Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a Description!';
                        }
                        return null;
                      },
                      onSaved: ((newValue) {
                        _newTask.description = newValue!;
                      }),
                      decoration: InputDecoration(
                        labelText: 'Task Description',
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                                style: BorderStyle.solid)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const Text(
                    'Task Priority',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Container(
                      height: 100,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ishard = !ishard;
                                  if (ismedium) {
                                    ismedium = false;
                                  }
                                  if (iseasy) {
                                    iseasy = false;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: ishard ? 40 : 30,
                                backgroundColor: Colors.red,
                                child: const FittedBox(child: Text('HARD')),
                              ),
                            ),
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ismedium = !ismedium;
                                  if (ishard) {
                                    ishard = false;
                                  }
                                  if (iseasy) {
                                    iseasy = false;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                  radius: ismedium ? 40 : 30,
                                  backgroundColor: Colors.yellow,
                                  child:
                                      const FittedBox(child: Text('MEDIUM'))),
                            ),
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  iseasy = !iseasy;
                                  if (ismedium) {
                                    ismedium = false;
                                  }
                                  if (ishard) {
                                    ishard = false;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: iseasy ? 40 : 30,
                                backgroundColor: Colors.green,
                                child: const FittedBox(child: Text('EASY')),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )),
          ElevatedButton.icon(
              onPressed: () {
                _saveForm(ishard
                    ? 'Hard'
                    : ismedium
                        ? 'Medium'
                        : iseasy
                            ? 'Easy'
                            : '');
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Task'))
        ],
      ),
    );
  }
}
