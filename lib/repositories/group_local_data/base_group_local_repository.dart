import '../../../models/group_model.dart';

abstract class BaseGroupLocalRepository{
  Future<GroupModel> getLastGroupFromCache();
  Future<void> groupToCache(GroupModel group);
}