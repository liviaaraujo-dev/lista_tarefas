import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_de_tarefas/pages/home/home_controller.dart';
import 'package:lista_de_tarefas/shared/helpers/size_extensions.dart';
import '../../shared/models/task_model.dart';
import '../../shared/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.getTasks();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.backgroundOrange,
      ),
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: homeController.isCarreg.value == true,
                    replacement: SizedBox(
                        height: context.percentHeight(.8),
                        width: context.percentWidth(.9),
                        child: Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primary))),
                    child: Visibility(
                      visible: homeController.tasks.isNotEmpty &&
                          homeController.isCarreg.value == true,
                      replacement: SizedBox(
                          height: context.percentHeight(.8),
                          width: context.percentWidth(.9),
                          child: Center(
                              child: Text(
                            'Nenhum contato salvo',
                            style:
                                TextStyle(fontSize: 18, color: AppColors.text),
                          ))),
                      child: Container(
                        height: context.percentHeight(.8),
                        width: context.percentWidth(.9),
                        margin: const EdgeInsets.only(top: 25),
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: homeController.tasks.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                  width: context.percentWidth(.8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: homeController
                                                .tasks[index].completed,
                                            checkColor: Colors.white,
                                            activeColor: AppColors.primary,
                                            onChanged: (bool? value) async {
                                              //homeController.toggleCheckbox();
                                              await homeController.updateTask(
                                                TaskModel(
                                                    objectId: homeController
                                                        .tasks[index].objectId,
                                                    completed: !homeController
                                                        .tasks[index]
                                                        .completed!,
                                                    description: homeController
                                                        .tasks[index]
                                                        .description),
                                              );
                                              homeController.getTasks();
                                            },
                                          ),
                                          Text(
                                            homeController
                                                .tasks[index].description!,
                                            style: TextStyle(
                                                color: AppColors.text,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await homeController.deleteTask(
                                              homeController
                                                  .tasks[index].objectId);
                                          homeController.getTasks();
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          size: 26,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  ));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: AppColors.background,
                child: Container(
                  height: context.percentHeight(.60),
                  width: context.percentWidth(.9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Criar tarefa',
                        style: TextStyle(color: AppColors.text, fontSize: 20),
                      ),
                      Container(
                        width: context.percentWidth(.70),
                        margin: EdgeInsets.only(top: 40),
                        height: 60,
                        child: TextFormField(
                          controller: homeController.description.value,
                          style: TextStyle(color: AppColors.text),
                          decoration: InputDecoration(
                              hintText: 'Descrição',
                              hintStyle: TextStyle(
                                  color: AppColors.text, fontSize: 18),
                              fillColor: AppColors.background2,
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          onPressed: () async {
                            homeController.createTask(TaskModel(
                                description:
                                    homeController.description.value.text,
                                completed: false));
                            Navigator.pop(context);
                            await homeController.getTasks();
                          },
                          child: Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
