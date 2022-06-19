part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();
  @override
  List<Object?> get props => [];
}

class LoadGroups extends GroupEvent{}
class UpdateGroups extends GroupEvent{
  final List<GroupModel> groups;
  UpdateGroups(this.groups);
  @override
  List<Object?> get props => [groups];
}
