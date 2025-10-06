import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Traker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List tabs = ['All', 'Completed'];
  late TabController _tabController;
  List<Task> tasksList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Task> completedTasks =
    tasksList.where((e) => e.completed == true).toList();
    tabs[1] = 'Completed (${completedTasks.length})';

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Traker'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AddNewTaskDialog(
              onSave: (task) {
                setState(() {
                  tasksList.insert(0, task);
                });
              },
            ),
          );
        },
        label: Row(
          children: [Text('Add New Task'), SizedBox(width: 4), Icon(Icons.add)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SizedBox(
            child:
            tasksList.isEmpty
                ? Center(child: Text('Add Your First Task.'))
                : ListView.builder(
              itemCount: tasksList.length,
              itemBuilder: (context, index) {
                final item = tasksList[index];
                return ListTile(
                  title: Text(
                    item.title,
                    style: TextStyle(
                      decoration:
                      item.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(item.mode),
                  trailing: SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AddNewTaskDialog(
                                onSave: (task) {
                                  setState(() {
                                    tasksList.setAll(index, [task]);
                                  });
                                },
                                task: item,
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        Checkbox(
                          value: item.completed,
                          onChanged: (value) {
                            setState(() {
                              tasksList[index].completed =
                              !item.completed;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            child:
            completedTasks.isEmpty
                ? Center(child: Text('Empty'))
                : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final item = completedTasks[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.mode),
                  trailing: Checkbox(
                    value: item.completed,
                    onChanged: (value) {
                      setState(() {
                        completedTasks[index].completed =
                        !item.completed;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddNewTaskDialog extends StatefulWidget {
  final Function(Task)? onSave;
  final Task? task;
  const AddNewTaskDialog({super.key, this.onSave, this.task});

  @override
  State<AddNewTaskDialog> createState() => _AddNewTaskDialogState();
}

class _AddNewTaskDialogState extends State<AddNewTaskDialog> {
  final titleCont = TextEditingController();
  List<String> modes = ['Study', 'Chill'];
  String selectedMode = 'Study';
  bool completed = false;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      setState(() {
        titleCont.text = widget.task!.title;
        selectedMode = widget.task!.mode;
        completed = widget.task!.completed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Select Mode'),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            children: List.generate(modes.length, (index) {
              final mode = modes[index];
              return InputChip(
                label: Text(mode),
                selected: selectedMode == mode,
                onSelected:
                    (value) => setState(() {
                  selectedMode = mode;
                }),
              );
            }),
          ),
          TextField(controller: titleCont, autofocus: true),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
        FilledButton(
          onPressed: () {
            widget.onSave!(
              Task(
                title: titleCont.text,
                mode: selectedMode,
                completed: completed,
              ),
            );
            Navigator.pop(context);
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    titleCont.dispose();
    super.dispose();
  }
}

class Task {
  final String title;
  final String mode;
  bool completed;
  Task({required this.title, required this.mode, required this.completed});

// bool get isCompleted => completed;
// set toggle(bool c) {
//   completed = c;
// }
}



/*
session 3
9/2/2025
*/