// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/resource_model.dart';

class PostModel extends ResourceModel {
  final String key;
  final String? title;
  final String? description;
  final String? location;
  final String? category;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;
  final int? hearts;
  List<String>? attachments;
  PostModel({
    this.key = '',
    this.title,
    this.description,
    this.dateCreated,
    this.dateUpdated,
    this.location,
    this.category,
    this.hearts = 0,
    this.attachments = const [],
  });
  @override
  Map<String, dynamic> toMap() {
    final formater = DateFormat(AppContants.dateFormat);
    return <String, dynamic>{
      'title': title,
      'description': description,
      'location': location,
      'category': category,
      'dateCreated': formater.format(dateCreated?? DateTime.now()),
      'dateUpdated': formater.format(dateUpdated?? DateTime.now()),
      'hearts': hearts,
      'attachments': attachments,
    };
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final formater = DateFormat(AppContants.dateFormat);
    return PostModel(
      key: '',
      title: json['title'] is String ? json['title'] : '',
      description: json['description'] is String ? json['description'] : '',
      location: json['location'] is String ? json['location'] : '',
      category: json['category'] is String ? json['category'] : '',
      hearts: (json['hearts'] is int) ? json['hearts'] : 0,
      attachments:
          json['attachments'] is List<String> ? json['attachments'] : null,
      dateCreated: ((json['dateCreated'] ?? '').isNotEmpty)
          ? formater.parse(json['dateCreated'])
          : null,
      dateUpdated: ((json['dateUpdated'] ?? '').isNotEmpty)
          ? formater.parse(json['dateUpdated'])
          : null,
    );
  }

  PostModel copyWith({
    String? key,
    String? title,
    String? description,
    String? location,
    String? category,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    int? hearts,
    List<String>? attachments,
    bool? updated
  }) {
    return PostModel(
      key: key ?? this.key,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      category: category ?? this.category,
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: updated == true ? DateTime.now() : dateUpdated ?? this.dateUpdated,
      hearts: hearts ?? this.hearts,
      attachments: attachments ?? this.attachments,
    );
  }



  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.title == title &&
        other.category == category &&
        other.location == location &&
        other.dateCreated == dateCreated &&
        other.dateUpdated == dateUpdated &&
        other.hearts == hearts &&
        listEquals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return key.hashCode ^
        title.hashCode ^
        description.hashCode ^
        dateCreated.hashCode ^
        dateUpdated.hashCode ^
        hearts.hashCode ^
        attachments.hashCode;
  }
  @override
  factory PostModel.fromMap(Map<String, dynamic> map) {
    final formater = DateFormat(AppContants.dateFormat);
    return PostModel(
      key: map.keys.contains('key') ? map['key'] as String: '',
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      location:
          map['location'] != null ? map['location'] as String : null,
      category:
          map['category'] != null ? map['category'] as String : null,
      dateCreated: map['dateCreated'] != null
          ? formater.parse(map['dateCreated'] as String)
          : null,
      dateUpdated: map['dateUpdated'] != null
          ? formater.parse(map['dateUpdated'] as String)
          : null,
      hearts: map['hearts'] != null ? map['hearts'] as int : 0,
      attachments: map['attachments'] != null ? List<String>.from(map['attachments']): const [],
    );
  }

  @override
  get id => key;
}
