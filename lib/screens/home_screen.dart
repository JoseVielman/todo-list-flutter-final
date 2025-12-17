import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    int pendingTasks =
        tasks.where((task) => !task.isCompleted).length;

    int completedTasks =
        tasks.where((task) => task.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text('Tareas Pendientes'),
                trailing: Text(
                  '$pendingTasks',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text('Tareas Completadas'),
                trailing: Text(
                  '$completedTasks',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Ver Lista de Tareas'),
              onPressed: () async {
                final updatedTasks = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TaskListScreen(tasks: tasks),
                  ),
                );

                if (updatedTasks != null) {
                  setState(() {
                    tasks = updatedTasks;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
