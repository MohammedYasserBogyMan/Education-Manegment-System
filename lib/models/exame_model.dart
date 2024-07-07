class ExameModel {
  ExameModel({
      this.status, 
      this.data,});

  ExameModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.date, 
      this.maxMarks, 
      this.createdAt, 
      this.updatedAt, 
      this.description, 
      this.teacherId, 
      this.courseId,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    maxMarks = json['max_marks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    teacherId = json['teacher_id'];
    courseId = json['course_id'];
  }
  int? id;
  String? date;
  int? maxMarks;
  String? createdAt;
  String? updatedAt;
  String? description;
  int? teacherId;
  dynamic courseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['max_marks'] = maxMarks;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['description'] = description;
    map['teacher_id'] = teacherId;
    map['course_id'] = courseId;
    return map;
  }

}