import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? Id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  StudentModel({required this.name, required this.age, this.Id});
}

// Build Runner
// flutter packages pub run build_runner watch --use-polling-watcher --delete-conflicting-outputs

