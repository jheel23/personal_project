class TaskModel {
  String id;
  String title;
  String description;
  String priority;
  bool? isCompleted;
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    this.isCompleted,
  });
}
