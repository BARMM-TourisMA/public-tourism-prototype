// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

import 'package:public_tourism/common/models/resource_model.dart';
import 'package:public_tourism/resource/resource_doc.dart';

typedef Filter = Map<String, dynamic>;

class PageInfo<T extends ResourceModel> {
  final int rowsPerPage;
  final int pageNum;
  List<T>? result;
  int? totalCount;

  PageInfo({required this.rowsPerPage, required this.pageNum});
}

abstract class BaseResource<T extends ResourceModel, K> {
  static final List<Future> _boxex = [];
  static Future ensureResources() async {
    await Future.forEach(_boxex, (element) => null);
  }

  //constructor
  BaseResource(this.collection, {this.keyField}) {
    boxReady = Hive.openBox<Map<String, dynamic>>(collection);
    _boxex.add(boxReady);
  }
  int hashFrom(String value) {
    return value.hashCode;
  }

  //fields
  final String collection;
  late Future<Box<Map<String, dynamic>>> boxReady;
  String? keyField;
  //abstract methods
  Future<T?> syncCreate(T recored);
  Future<T?> syncDelete(T recored);
  Future<bool?> syncClear();
  Future<List<T>?> syncFind(Filter? filter);
  T fromMap(Filter filter);
  Future<T?> syncGet(String key);
  Future<T?> syncUpdate(T record);
  Future<T?> syncPatch(T record, String field);
  T fromJson(Map<String, dynamic> record);
  T copyWithKey(T data, String id);
  //static fields
  static int requestDelay = 1000;
  void _manageDocSyncing(ResourceDoc<T> doc) async {
    switch (doc.status) {
      case DocStatus.saved:
        var status = await syncCreate(doc.record);
        if (status is T) {
          await updateData(doc.key, status);
        }
        break;
      case DocStatus.updated:
        var status = await syncUpdate(doc.record);
        if (status is T) {
          await setRecord(doc.record,
              key: doc.key, docStatus: DocStatus.synced);
        }
        break;
      case DocStatus.synced:
      default:
        final status = await syncGet(doc.key);
        if (status is T) {
          await setRecord(status, key: doc.key, docStatus: DocStatus.synced);
        }
    }
  }

  ResourceDoc<T> _docFromMap(Map<String, dynamic> map) {
    
    map['record'] = fromMap(map['record']); 
    return ResourceDoc<T>.fromMap(map);
  }

  Future<List<ResourceDoc<T>>> findDocs(
      {Filter? filter, PageInfo<T>? pageInfo}) async {
    final box = await boxReady;
    
    var list = box.toMap().map((k, e) {
      return MapEntry(k.toString(), _docFromMap(e));
    }).values.toList();
    return list
        .where((element) => filter == null || element.record == fromMap(filter))
        .toList();
  }

  Future<List<T>> find({Filter? filter, PageInfo<T>? pageInfo}) async {
    final result = await findDocs(filter: filter, pageInfo: pageInfo);
    return result.map((doc) {
      _manageDocSyncing(doc);
      return doc.record;
    }).toList();
  }

  Future<ResourceDoc<T>?> findOneDoc({String? key, Filter? filter}) async {
    final box = await boxReady;
    final doc = box.get(key);
    if (null != doc) {
      return _docFromMap(doc);
    }
    return null;
  }

  Future<T?> findOne({String? key, Filter? filter}) async {
    final doc = await findOneDoc(key: key);
    return doc?.record;
  }

  Future<T> setRecord(T record,
      {String? key, bool? createOnly, DocStatus? docStatus}) async {
    final box = await boxReady;
    await box.put(
        record.id,
        ResourceDoc(
                status: docStatus ?? DocStatus.created,
                key: record.id,
                record: record)
            .toMap());
    return record;
  }

  Future<T?> setRecordStatus({String? key, DocStatus? docStatus}) async {
    final box = await boxReady;
    final old = await findOneDoc(key: key);
    if (old is ResourceDoc) {
      final updated = old!.copyWith(status: docStatus ?? old.status);
      await box.put(key, updated.toMap());
      return updated.record;
    }
    return null;
  }

  Future<T> updateData(String key, T value) async {
    final existing = await findOneDoc(key: key);
    if (existing is ResourceDoc<T>) {
      final box = await boxReady;
      existing.record = value;
      existing.status = DocStatus.updated;
      await box.put(key, existing.toMap());
      _manageDocSyncing(existing);
    }
    return existing?.record ?? value;
  }

  Future<int> count() async {
    final box = await boxReady;
    return box.length;
  }
  Stream<List<T>> stream({Filter? filter}) async* {
    final coll = FirebaseFirestore.instance.collection(collection);
    final snapshot = coll.snapshots();
    
    // final offline = await find(filter: filter);
    // yield offline;
    await for (QuerySnapshot q in snapshot) {
      var list = q.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        final model = fromJson(data);
        final copy = copyWithKey(model, doc.id);
        setRecord(copy);
        return copy;
      }).toList();
      yield list;
    }
  }
}
