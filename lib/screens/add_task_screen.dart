import 'package:flutter/material.dart';
import 'package:personal_project_one/widgets/add_task_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(
            context); //This line of code gives us the current focus of the full screen
        if (!currentFocus.hasPrimaryFocus) {
          //here we check if the screen has the primary focus or not
          //if not then we unfocus the screen to remove the keyboard
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Task'),
        ),
        body: const AddTaskWidget(),
      ),
    );
  }
}
