import 'package:dstu_helper/models/group_model.dart';

abstract class BaseGroupRepository{
  Stream<List<GroupModel>> getAllGroups();
}