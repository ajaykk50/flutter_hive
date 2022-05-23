import 'package:flutter/material.dart';
import 'package:flutter_hive_db/db/functions/db_functions.dart';

import '../../../db/model/data_model.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(studentList[index].name),
                subtitle: Text(studentList[index].age),
                trailing: IconButton(
                  onPressed: () {
                    if (studentList[index].Id != null) {
                      deleteStudent(studentList[index].Id!);
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: studentList.length);
      },
    );
  }
}
