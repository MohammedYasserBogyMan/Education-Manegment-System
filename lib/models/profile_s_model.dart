class ProfileSModel {
  ProfileSModel({
      this.status, 
      this.data,});

  ProfileSModel.fromJson(dynamic json) {
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
      this.firstName, 
      this.middleName, 
      this.lastName, 
      this.birthDate, 
      this.address, 
      this.phoneNumber, 
      this.email, 
      this.password, 
      this.gender, 
      this.classroom,
      this.parentName, 
      this.createdAt, 
      this.updatedAt, 
      this.roleId,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    classroom = json['classroom'];
    parentName = json['parent_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
  }
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  dynamic birthDate;
  dynamic address;
  dynamic phoneNumber;
  String? email;
  String? password;
  dynamic gender;
  dynamic classroom;
  dynamic parentName;
  String? createdAt;
  String? updatedAt;
  dynamic roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['middle_name'] = middleName;
    map['last_name'] = lastName;
    map['birth_date'] = birthDate;
    map['address'] = address;
    map['phone_number'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    map['gender'] = gender;
    map['classroom'] = classroom;
    map['parent_name'] = parentName;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['role_id'] = roleId;
    return map;
  }

}