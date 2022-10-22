import 'dart:math';

import 'package:assignmen_day3_tasks/APIHelper.dart';
import 'package:assignmen_day3_tasks/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

// "FirstName": "string",
//   "LastName": "string",
//   "Mobile": "string",
//   "Email": "string",
//   "NationalID": "string",
//   "Age": 0
class _AddStudentScreenState extends State<AddStudentScreen> {
  // List<String> levels = ['Leval 1', 'Leval 2', 'Leval 3', 'Leval 4'];
  // String SelectedLevel = 'Leval 1';
  var api = APIHelper();

  var Task1 = Task(
    ID: 0,
    Title: "1 ",
    IsDone: false,
    CreatedDate: "2022-10-1",
  );
  @override
  void initState() {
    // api.saveStudent(Std);
  }

  var form = GlobalKey<FormState>();
  SaveForm() async {
    if (form.currentState!.validate()) {
      form.currentState?.save();
      await api.saveTask(Task1);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
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
