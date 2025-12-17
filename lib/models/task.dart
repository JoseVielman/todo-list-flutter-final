class Task {
  String title;
  String description;
  String type;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.type,
    this.isCompleted = false,
  });
}
