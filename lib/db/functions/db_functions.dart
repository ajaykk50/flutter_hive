import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.Id = _id;

  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getStudent() async {
  final stuentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(stuentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.delete(id);
  getStudent();
}
