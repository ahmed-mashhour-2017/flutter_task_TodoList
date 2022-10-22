import 'package:assignmen_day3_tasks/APIHelper.dart';
import 'package:assignmen_day3_tasks/models.dart';
import 'package:flutter/material.dart';

class EditStudentScreen extends StatefulWidget {
  const EditStudentScreen({super.key});

  @override
  State<EditStudentScreen> createState() => EditStudentScreenState();
}

class EditStudentScreenState extends State<EditStudentScreen> {
  // List<String> levels = ['Leval 1', 'Leval 2', 'Leval 3', 'Leval 4'];
  // String SelectedLevel = 'Leval 1';
  var api = APIHelper();
  var Task1 = Task(
    ID: 0,
    Title: "",
    IsDone: false,
    CreatedDate: "2022-10-22",
  );

  var form = GlobalKey<FormState>();
  SaveForm() async {
    if (form.currentState!.validate()) {
      form.currentState?.save();
      await api.deleteTask(Task1.ID);
      await api.saveTask(Task1);
      print(Task1.ID);
      print(Task1.Title);
      print(Task1.IsDone);
      print(Task1.CreatedDate);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments! as Map<String, Object>;
    Task1.ID = args['id'] as int;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                form.currentState?.reset();
              },
              icon: Icon(Icons.replay))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
            key: form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("First Name"), icon: Icon(Icons.abc)),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "must enter Frist name ";
                    }
                    if (value.length < 3) {
                      return "Frist name must have atleast 3 letters";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      Task1.Title = newValue!;
                    });
                  },
                ),
                ElevatedButton(onPressed: SaveForm, child: Text("Save"))
              ],
            )),
      ),
    );
  }
}
