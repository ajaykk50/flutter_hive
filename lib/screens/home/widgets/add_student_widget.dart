import 'package:flutter/material.dart';
import 'package:flutter_hive_db/db/functions/db_functions.dart';
import 'package:flutter_hive_db/db/model/data_model.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                onAddStudentBtnClicked();
              },
              child: const Text("Save"))
        ],
      ),
    );
  }

  Future<void> onAddStudentBtnClicked() async {
    final _name = _nameController.text;
    final _age = _ageController.text;

    if (_name == null || _age == null) {
      return;
    }
    addStudent(StudentModel(name: _name, age: _age));
  }
}
