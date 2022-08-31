import 'dart:convert';

import 'package:public_tourism/common/models/resource_model.dart';

enum DocStatus { created, saved, synced, updated, deleted }

class ResourceDoc<T extends ResourceModel> {
  DocStatus status;
  final String key;
  T record;
  ResourceDoc({
    required this.status,
    required this.key,
    required this.record,
  });

  ResourceDoc<T> copyWith({
    DocStatus? status,
    String? key,
    T? record,
  }) {
    return ResourceDoc<T>(
      status: status ?? this.status,
      key: key ?? this.key,
      record: record ?? this.record,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.name,
      'key': key.toString(),
      'record': record.toMap(),
    };
  }

  static DocStatus fromStrEnum(String enumStr) {
    DocStatus status = DocStatus.created;
    for (var val in DocStatus.values) {
      if (val.name == enumStr) {
        status = val;
      }
    }
    return status;
  }

  factory ResourceDoc.fromMap(Map<String, dynamic> map) {
    final status = map['status'] != null ? fromStrEnum(map['status']) : DocStatus.saved;
    final key = map['key'] ?? '';
    final record = map['record'];
    return ResourceDoc<T>(
      status: status,
      key: key,
      record: record,
    );
  }
  String toJson() => json.encode(toMap());
}