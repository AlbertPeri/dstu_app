part of 'group_local_bloc.dart';

abstract class GroupLocalState extends Equatable {
  const GroupLocalState();
}

class GroupLocalLoading extends GroupLocalState {
  @override
  List<Object> get props => [];
}
class GroupLocalLoaded extends GroupLocalState {
  final GroupModel group;
  GroupLocalLoaded({required this.group});
  @override
  // TODO: implement props
  List<Object?> get props => [group];
}
