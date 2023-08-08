import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_de_tarefas/shared/models/task_model.dart';
import 'package:lista_de_tarefas/shared/repositorys/task_repository.dart';

class HomeController extends GetxController {
  var isChecked = false.obs;
  var isCarreg = false.obs;
  var tasks = <TaskModel>[].obs;
  TaskRepository taskRepository = TaskRepository();

  var description = TextEditingController().obs;

  void toggleCheckbox() => isChecked.value = !isChecked.value;

  setIsCarreg() => isCarreg.value = true;

  getTasks() async {
    tasks.value = await taskRepository.getTasks();
    setIsCarreg();
  }

  createTask(TaskModel taskModel) async {
    await taskRepository.createTask(taskModel);
  }

  updateTask(TaskModel taskModel) async {
    await taskRepository.updateTask(taskModel);
  }

  deleteTask(id) async {
    await taskRepository.deleteTask(id);
  }
}
