part of 'group_local_bloc.dart';

abstract class GroupLocalEvent extends Equatable {
  const GroupLocalEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadGroupsFromCache extends GroupLocalEvent{}
class WriteGroupToCache extends GroupLocalEvent{
  final GroupModel group;
  WriteGroupToCache(this.group);
  @override
  List<Object?> get prop => [group];
}

class UpdateGroupsCache extends GroupLocalEvent{
  final GroupModel group;
  UpdateGroupsCache(this.group);
  @override
  List<Object?> get prop => [group];
}
