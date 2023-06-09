class UserModel {
  int? id;
  String? token;
  String? name;
  String? email;

  UserModel({this.id, this.token, this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['name'] = name;
    data['email'] = email;
    return data;  }
}
