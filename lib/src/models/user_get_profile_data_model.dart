class UserGetProfileDataModel {
  final String? message;
  final Data? data;

  UserGetProfileDataModel({
    this.message,
    this.data,
  });

  UserGetProfileDataModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};
}

class Data {
  final String? email;
  final String? username;
  final List<dynamic>? interests;

  Data({
    this.email,
    this.username,
    this.interests,
  });

  Data.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String?,
        username = json['username'] as String?,
        interests = json['interests'] as List?;

  Map<String, dynamic> toJson() =>
      {'email': email, 'username': username, 'interests': interests};
}
