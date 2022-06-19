import 'package:dstu_helper/models/group_model.dart';
import 'package:dstu_helper/repositories/group_local_data/group_local_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'group_local_event.dart';
part 'group_local_state.dart';

class GroupLocalBloc extends Bloc<GroupLocalEvent, GroupLocalState> {
  final GroupLocalRepository _groupLocalRepository;
  final GroupModel _groupModel;

  GroupLocalBloc({required GroupLocalRepository groupLocalRepository,required GroupModel groupModel}) :
        _groupModel = groupModel,
        _groupLocalRepository = groupLocalRepository,
        super(GroupLocalLoading()) {

    on<WriteGroupToCache>((event, emit) async {
      await _groupLocalRepository.groupToCache(_groupModel);
    });
    on<LoadGroupsFromCache>((event, emit) {
      _groupLocalRepository.getLastGroupFromCache().then((group) {
        add(UpdateGroupsCache(group));
      });
    });
    on<UpdateGroupsCache>((event, emit) {
      emit(GroupLocalLoaded(group: event.group));
    });
  }
}
