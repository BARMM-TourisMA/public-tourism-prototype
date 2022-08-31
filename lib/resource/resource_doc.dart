import 'dart:convert';

import 'package:public_tourism/common/models/resource_model.dart';

enum DocStatus { created, saved, synced, updated, deleted }

class ResourceDoc<T extends ResourceModel, K> {
  DocStatus status;
  final K key;
  T record;
  ResourceDoc({
    required this.status,
    required this.key,
    required this.record,
  });

  ResourceDoc<T, K> copyWith({
    DocStatus? status,
    K? key,
    T? record,
  }) {
    return ResourceDoc<T, K>(
      status: status ?? this.status,
      key: key ?? this.key,
      record: record ?? this.record,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.toString(),
      'key': key.toString(),
      'record': record.toMap(),
    };
  }

  static DocStatus fromStrEnum(String enumStr) {
    return DocStatus.values
        .firstWhere((key) => key.toString() == 'DocStatus.$enumStr');
  }

  factory ResourceDoc.fromMap(Map<String, dynamic> map) {
    return ResourceDoc<T, K>(
      status:
          map['status'] != null ? fromStrEnum(map['status']) : DocStatus.saved,
      key: map['key'],
      record: map['record'],
    );
  }
  String toJson() => json.encode(toMap());
}