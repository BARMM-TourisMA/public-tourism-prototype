

import 'package:hive/hive.dart';

enum DocStatus { created, saved, synced, updated, deleted }

abstract class ResourceModel {
  dynamic get id;
}

typedef Filter = Map<String, dynamic>;

class ResourceDoc<T extends ResourceModel, K> {
  DocStatus status;
  final K key;
  T record;
  ResourceDoc({
    required this.status,
    required this.key,
    required this.record,
  });
}

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
    boxReady = Hive.openBox<ResourceDoc<T, K>>(collection);
    _boxex.add(boxReady);
  }
  int hashFrom(String value) {
    return value.hashCode;
  }
  //fields
  final String collection;
  late Future<Box<ResourceDoc<T, K>>> boxReady;
  String? keyField;
  //abstract methods
  Future<T?> syncCreate(T recored);
  Future<T?> syncDelete(T recored);
  Future<bool?> syncClear();
  Future<List<T>?> syncFind(Filter? filter);
  Future<T?> syncGet(K key);
  Future<T?> syncUpdate(T record);
  Future<T?> syncPatch(T record, String field);

  //static fields
  static int requestDelay = 1000;
  void _manageDocSyncing(ResourceDoc<T, K> doc) async {
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

  Future<List<ResourceDoc<T, K>>> findDocs(
      {Filter? filter, PageInfo<T>? pageInfo}) async {
    
    throw "not implemted";
  }

  Future<List<T>> find({Filter? filter, PageInfo<T>? pageInfo}) async {
    final result = await findDocs(filter: filter, pageInfo: pageInfo);
    return result.map((doc) {
      _manageDocSyncing(doc);
      return doc.record;
    }).toList();
  }

  Future<ResourceDoc<T, K>?> findOneDoc({K? key, Filter? filter}) async {
    final box = await boxReady;
    return box.get(key);
  }

  Future<T?> findOne({K? key, Filter? filter}) async {
    final doc = await findOneDoc(key: key);
    return doc?.record;
  }

  Future<T> setRecord(T record,
      {K? key, bool? createOnly, DocStatus? docStatus}) {
    throw "not implemted";
  }
  Future<T> setRecordStatus({K? key, DocStatus? docStatus}) {
    throw "not implemted";
  }
  Future<T> updateData(K key, T value) async {
    final existing = await findOneDoc(key: key);
    if (existing is ResourceDoc<T, K>) {
      final box = await boxReady;
      existing.record = value;
      existing.status = DocStatus.updated;
      await box.put(key, existing);
      _manageDocSyncing(existing);
    }
    return existing?.record ?? value;
  }

  Future<int> count() async {
    final box = await boxReady;
    return box.length;
  }
}
