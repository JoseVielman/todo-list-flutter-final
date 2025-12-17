import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Tarea')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${task.title}'),
            Text('Descripción: ${task.description}'),
            Text('Tipo: ${task.type}'),
            Text(
              'Estado: ${task.isCompleted ? "Completada" : "Pendiente"}',
            ),
          ],
        ),
      ),
    );
  }
}
