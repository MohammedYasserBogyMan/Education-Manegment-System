class New {
  New({
      this.status, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.password, 
      this.phoneNumber, 
      this.subjectTaught, 
      this.classSectionAssigned, 
      this.updatedAt, 
      this.createdAt, 
      this.id, 
      this.teacherToken, 
      this.message,});

  New.fromJson(dynamic json) {
    status = json['status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    subjectTaught = json['subject_taught'];
    classSectionAssigned = json['class_section_assigned'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    teacherToken = json['teacher_token'];
    message = json['message'];
  }
  bool? status;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  dynamic phoneNumber;
  dynamic subjectTaught;
  dynamic classSectionAssigned;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? teacherToken;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['phone_number'] = phoneNumber;
    map['subject_taught'] = subjectTaught;
    map['class_section_assigned'] = classSectionAssigned;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['teacher_token'] = teacherToken;
    map['message'] = message;
    return map;
  }

}