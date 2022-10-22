import 'package:assignmen_day3_tasks/APIHelper.dart';
import 'package:assignmen_day3_tasks/models.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() {
    return ListScreenState();
  }
}

class ListScreenState extends State<ListScreen> {
  APIHelper api = APIHelper();
  List<Task> Tasks = [
    // Task(ID: 1, Title: "asd", IsDone: false, CreatedDate: "22-10-2022")
  ];

  fetchData() async {
    var temp = await api.getaAllTasks();
    setState(() {
      Tasks = temp;
    });
    print("hello");
  }

  @override
  void initState() {
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks count ${Tasks.length}"),
        actions: [
          IconButton(
              onPressed: () {
                fetchData();
              },
              icon: Icon(Icons.replay))
        ],
      ),
      body: (Tasks.isEmpty)
          ? Center(
              child: Column(
                children: [
                  Text("Loading........"),
                  IconButton(
                    onPressed: () {
                      Delete(535, context);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: Tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Tasks[index].Title),
                  subtitle: Text(Tasks[index].CreatedDate),
                  trailing: Container(
                    width: 150,
                    child: Row(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/edit",
                              arguments: {"id": Tasks[index].ID});
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Delete(Tasks[index].ID, context);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ]),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/add");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void Delete(int id, BuildContext ctx) async {
    var isSuccess = await api.deleteTask(id);

    fetchData();
  }
}
