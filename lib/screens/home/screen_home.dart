import 'package:flutter/material.dart';
import 'package:flutter_hive_db/db/functions/db_functions.dart';
import 'widgets/add_student_widget.dart';
import 'widgets/list_student_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getStudent();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudent(),
          const Expanded(
            child: ListStudent(),
          ),
        ],
      )),
    );
  }
}
