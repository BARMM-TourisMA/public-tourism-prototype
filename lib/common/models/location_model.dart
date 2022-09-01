// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:public_tourism/common/models/resource_model.dart';

class LocationModel extends ResourceModel {
  final String key;
  final String? title;
  final String? description;
  final String? image;
  LocationModel({
    this.key = '',
    this.title,
    this.description,
    this.image,
  });

  LocationModel copyWith({
    String? key,
    String? title,
    String? description,
    String? image,
  }) {
    return LocationModel(
      key: key ?? this.key,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      key: map['key'] as String,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'LocationModel(key: $key, title: $title, description: $description, image: $image)';
  }
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      key: '',
      title: json['title'] is String ? json['title'] : '',
      description: json['description'] is String ? json['description'] : '',
      image: json['image'] is String ? json['image'] : '',
    );
  }
  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.key == key &&
      other.title == title &&
      other.description == description &&
      other.image == image;
  }

  @override
  int get hashCode {
    return key.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image.hashCode;
  }
  
  @override
  get id => key;
}
