import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dstu_helper/models/group_model.dart';
import 'package:dstu_helper/repositories/group/group_repository.dart';
import 'package:equatable/equatable.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {

  final GroupRepository _groupRepository;
  StreamSubscription? _groupSubscription;

  GroupBloc({required GroupRepository groupRepository})
      : _groupRepository = groupRepository,
        super(GroupInitial()) {

    on<LoadGroups>((event, emit){
          _groupSubscription?.cancel();
          _groupSubscription = _groupRepository.getAllGroups().listen((groups){
            add(UpdateGroups(groups));
          });
    });
    on<UpdateGroups>((event, emit) {
      emit(GroupLoaded(groups: event.groups));
    });
  }
}
