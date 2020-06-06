import 'dart:collection';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:login_signup/task.dart';
import 'package:flutter/cupertino.dart';

class FoodNotifier with ChangeNotifier{
  List<Task> _taskList = [];
  Task _currenttask;

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  Task get currenttask => _currenttask;

  set taskList(List<Task> taskList) {
    _taskList = taskList;
    notifyListeners();
  }

  set currenttask(Task task) {
    _currenttask = task;
    notifyListeners();
  }
}