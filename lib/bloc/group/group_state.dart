part of 'group_bloc.dart';

abstract class GroupState extends Equatable {
  const GroupState();
}
class GroupInitial extends GroupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GroupLoading extends GroupState {
  @override
  List<Object> get props => [];
}
class GroupLoaded extends GroupState {
  final List<GroupModel> groups;
  GroupLoaded({this.groups = const <GroupModel>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [groups];
}
