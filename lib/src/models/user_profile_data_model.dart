class UserProfileDataModel {
  final String? message;
  final Data? data;

  UserProfileDataModel({
    this.message,
    this.data,
  });

  UserProfileDataModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};
}

class Data {
  final String? email;
  final String? username;
  final String? name;
  final String? birthday;
  final String? horoscope;
  final int? height;
  final int? weight;
  final List<String>? interests;

  Data({
    this.email,
    this.username,
    this.name,
    this.birthday,
    this.horoscope,
    this.height,
    this.weight,
    this.interests,
  });

  Data.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String?,
        username = json['username'] as String?,
        name = json['name'] as String?,
        birthday = json['birthday'] as String?,
        horoscope = json['horoscope'] as String?,
        height = json['height'] as int?,
        weight = json['weight'] as int?,
        interests = (json['interests'] as List?)
            ?.map((dynamic e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'name': name,
        'birthday': birthday,
        'horoscope': horoscope,
        'height': height,
        'weight': weight,
        'interests': interests
      };
}
