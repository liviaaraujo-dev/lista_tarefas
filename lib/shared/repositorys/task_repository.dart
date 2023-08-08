import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lista_de_tarefas/shared/models/task_model.dart';

class TaskRepository {
  final Dio _dio = Dio();

  Future<List<TaskModel>> getTasks() async {
    try {
      final response = await _dio.get(
        dotenv.get('BASEURL'),
        options: Options(
          headers: {
            'X-Parse-Application-Id': dotenv.get('XPARSEAPPLICATIONID'),
            'X-Parse-REST-API-Key': dotenv.get('XPARSEESTAPIKEY'),
          },
        ),
      );

      return TasksModel.fromJson(response.data).results as List<TaskModel>;
    } catch (error) {
      print('Erro ao fazer a requisição: $error');
      return [];
    }
  }

  Future<void> createTask(TaskModel taskModel) async {
    try {
      final response = await _dio.post(dotenv.get('BASEURL'),
          options: Options(
            headers: {
              'X-Parse-Application-Id': dotenv.get('XPARSEAPPLICATIONID'),
              'X-Parse-REST-API-Key': dotenv.get('XPARSEESTAPIKEY'),
            },
          ),
          data: taskModel.toCreateJson());
    } catch (error) {
      throw error;
    }
  }

  Future<void> deleteTask(String objectId) async {
    try {
      final response = await _dio.delete(
        dotenv.get('BASEURL') + objectId.toString(),
        options: Options(
          headers: {
            'X-Parse-Application-Id': dotenv.get('XPARSEAPPLICATIONID'),
            'X-Parse-REST-API-Key': dotenv.get('XPARSEESTAPIKEY'),
          },
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateTask(TaskModel taskModel) async {
    try {
      final response =
          await _dio.put(dotenv.get('BASEURL') + taskModel.objectId.toString(),
              options: Options(
                headers: {
                  'X-Parse-Application-Id': dotenv.get('XPARSEAPPLICATIONID'),
                  'X-Parse-REST-API-Key': dotenv.get('XPARSEESTAPIKEY'),
                },
              ),
              data: taskModel.toCreateJson());
    } catch (error) {
      throw error;
    }
  }
}
