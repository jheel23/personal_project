import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_project_one/Database/local_databse.dart';
import 'package:personal_project_one/models/task.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]);
  void addTask(TaskModel addtask) {
    state = [...state, addtask];
    LocalDatabaseHelper.insertData('user_tasks', {
      'id': addtask.id,
      'title': addtask.title,
      'description': addtask.description,
      'priority': addtask.priority,
      'isCompleted': addtask.isCompleted,
    });
  }

  void deleteTask(TaskModel deletetask) async {
    state = state.where((oneTask) => oneTask.id != deletetask.id).toList();
    LocalDatabaseHelper.deleteData('user_tasks', deletetask.id);
  }

  Future<void> fetchAndSetData() async {
    final dataList = await LocalDatabaseHelper.getData('user_tasks');
    state = dataList
        .map(
          (item) => TaskModel(
            id: item['id'],
            title: item['title'],
            description: item['description'],
            priority: item['priority'],
            isCompleted: item['isCompleted'],
          ),
        )
        .toList();
  }
}

final taskProvider =
    StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref) {
  return TaskNotifier();
});
