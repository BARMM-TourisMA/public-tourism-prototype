// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/resource_model.dart';

class PostModel extends ResourceModel {
  late String key;
  String? title;
  String? description;
  DateTime? dateCreated;
  DateTime? dateUpdated;
  int? hearts;
  List<String>? attachments;
  PostModel({
    this.title,
    this.description,
    this.dateCreated,
    this.dateUpdated,
    this.hearts,
    this.attachments,
  });
  Map<String, dynamic> toMap() {
    final formater = DateFormat(AppContants.dateFormat);
    return {
      "title": title,
      "description": description,
      "attachments": attachments,
      "hearts": hearts,
      "dateCreated": dateCreated != null ? formater.format(dateCreated!) : '',
      "dateUpdated": dateUpdated != null ? formater.format(dateUpdated!) : '',
    };
  }
  String toJson() {
    return jsonEncode(toMap());
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final formater = DateFormat(AppContants.dateFormat);
    return PostModel(
      title: json['title'] is String ? json['title']: '',
      description: json['description'] is String ? json['description'] : '',
      hearts: (json['hearts'] is int) ? json['hearts']: 0,
      attachments: json['attachments'] is List<String> ? json['attachments']: null,
      dateCreated: ((json['dateCreated'] ?? '').isNotEmpty) ? formater.parse(json['dateCreated']): null,
      dateUpdated: ((json['dateUpdated'] ?? '').isNotEmpty) ? formater.parse(json['dateUpdated']): null,
    );
  }
  
  @override
  get id => key; 
}
