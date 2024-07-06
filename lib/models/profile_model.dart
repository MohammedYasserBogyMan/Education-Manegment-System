// class ProfileModel {
//   ProfileModel({
//       this.id,
//       this.name,
//       this.email,
//       this.image,
//       this.createdAt,
//       this.updatedAt,
//       this.roleId,
//       this.permisionId,});
//
//   ProfileModel.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     roleId = json['role_id'];
//     permisionId = json['permision_id'];
//   }
//   int? id;
//   String? name;
//   String? email;
//   String? image;
//   String? createdAt;
//   String? updatedAt;
//   dynamic roleId;
//   dynamic permisionId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['email'] = email;
//     map['image'] = image;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     map['role_id'] = roleId;
//     map['permision_id'] = permisionId;
//     return map;
//   }
//
// }