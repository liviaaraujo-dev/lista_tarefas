class TasksModel {
  List<TaskModel>? results;

  TasksModel({this.results});

  TasksModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <TaskModel>[];
      json['results'].forEach((v) {
        results!.add(new TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskModel {
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? description;
  bool? completed;

  TaskModel(
      {this.objectId,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.completed});

  TaskModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['description'] = this.description;
    data['completed'] = this.completed;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['completed'] = this.completed;
    return data;
  }
}
