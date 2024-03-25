class CountryModel {
  CountryModel({
    this.result,
    this.code,
    this.message,
    this.error,
  });

  Result? result;
  double? code;
  String? message;
  dynamic error;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        result: json['result'] != null
            ? Result.fromJson(json['result'] as Map<String, dynamic>)
            : null,
        code: json['code'] as double?,
        message: json['message'] as String?,
        error: json['error'],
      );

  Map<String, dynamic> toJson() => {
        'result': result?.toJson(),
        'code': code,
        'message': message,
        'error': error,
      };
}

class Result {
  Result({
    this.count,
    this.data,
  });

  int? count;
  List<Data>? data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        count: json['count'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

class Data {
  Data({
    this.name,
    this.id,
    this.isDeleted,
  });

  String? name;
  int? id;
  bool? isDeleted;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'] as String?,
        id: json['id'] as int?,
        isDeleted: json['isDeleted'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'isDeleted': isDeleted,
      };
}
