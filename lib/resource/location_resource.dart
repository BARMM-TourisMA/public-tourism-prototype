import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/location_model.dart';
import 'package:public_tourism/resource/base.resource.dart';

class LocationResource extends BaseResource<LocationModel, int> {
  static LocationResource store = LocationResource(AppContants.locationCollection);
  LocationResource(super.collection, {super.keyField});

  @override
  Future<bool?> syncClear() async {
    return null;
  }

  @override
  Future<LocationModel?> syncCreate(LocationModel recored) async {
    return null;
  }

  @override
  Future<LocationModel?> syncDelete(LocationModel recored) async {
    return null;
  }

  @override
  Future<List<LocationModel>?> syncFind(Filter? filter) async {
    return null;
  }

  @override
  Future<LocationModel?> syncGet(String key) async {
    return null;
  }

  @override
  Future<LocationModel?> syncPatch(LocationModel record, String field) async {
    return null;
  }

  @override
  Future<LocationModel?> syncUpdate(LocationModel record) async {
    return null;
  }


  @override
  LocationModel fromMap(Filter filter) {
    return LocationModel.fromMap(filter);
  }
  
  @override
  LocationModel copyWithKey(LocationModel data, String id) {
    return data.copyWith(key: id);
  }
  
  @override
  LocationModel fromJson(Map<String, dynamic> record) {
    return LocationModel.fromJson(record);
  }
}
