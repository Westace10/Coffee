class TaskModel {
  final String taskTitle;
  final String taskId;
  final String taskStartDate;
  final String taskEndDate;
  final String taskDescription;

  TaskModel({
    required this.taskDescription,
    required this.taskEndDate,
    required this.taskId,
    required this.taskStartDate,
    required this.taskTitle,
  });
}
