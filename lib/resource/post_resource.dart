import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/post_model.dart';
import 'package:public_tourism/resource/base.resource.dart';

class PostResource extends BaseResource<PostModel, int>{
  static PostResource store = PostResource(AppContants.postCollection);
  PostResource(super.collection, {super.keyField});

  @override
  Future<bool?> syncClear() async {
    return null;
  }

  @override
  Future<PostModel?> syncCreate(PostModel recored) async {
    return null;
  }

  @override
  Future<PostModel?> syncDelete(PostModel recored) async {
    return null;
  }

  @override
  Future<List<PostModel>?> syncFind(Filter? filter) async {
    return null;
  }

  @override
  Future<PostModel?> syncGet(int key) async {
    return null;
  }

  @override
  Future<PostModel?> syncPatch(PostModel record, String field) async {
    return null;
  }

  @override
  Future<PostModel?> syncUpdate(PostModel record) async {
    return null;
  }
}

