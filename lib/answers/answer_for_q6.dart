/*
Question:  Build a To-Do List application where users can add, delete, and mark tasks as completed.
a. Store task data in an SQLite database (using the sqflite package).
b. Ensure that tasks remain saved even after closing and reopening the application.
*/
//Solution:

import '../widgets.dart';

class AnswerForQ6 extends StatefulWidget {
  const AnswerForQ6({super.key});

  @override
  State<AnswerForQ6> createState() => _AnswerForQ6State();
}

class _AnswerForQ6State extends State<AnswerForQ6> {
  List<Task> _tasks = [];
  final _dbHelper = DBHelper();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  //Fetch tasks from the database
  Future<void> fetchTasks() async {
    final tasks = await _dbHelper.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }
  //-------------------------------------------

  //Add a new task
  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;
    final newTask = Task(title: title, isDone: false);
    await _dbHelper.insertTask(newTask);
    _controller.clear();
    await fetchTasks();
  }
  //-------------------------------------------

  //Mark a task as done or undone
  Future<void> toggleTask(Task task) async {
    final updatedTask =
        Task(id: task.id, title: task.title, isDone: !task.isDone);
    await _dbHelper.updateTask(updatedTask);
    await fetchTasks();
  }
  //-------------------------------------------

  //Delete a task
  Future<void> deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    await fetchTasks();
  }
  //-------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => addTask(_controller.text),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (_, index) {
              final task = _tasks[index];

              return ListTile(
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (_) => toggleTask(task),
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteTask(task.id!),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
