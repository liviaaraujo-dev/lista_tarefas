import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            checkColor: Colors.white,
            value: isChecked,
            activeColor: AppColors.primary,
            onChanged: (bool? value) async {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Text(
            'Tarefa',
            style: TextStyle(
                color: AppColors.text,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          InkWell(
            child: const Icon(
              Icons.delete,
              size: 26,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
