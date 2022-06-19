

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../consts.dart';
import '../../models/group_model.dart';
import 'base_group_local_repository.dart';

class GroupLocalRepository implements BaseGroupLocalRepository{



  @override
  Future<GroupModel> getLastGroupFromCache() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonGroup = sharedPreferences.getString(Constants.CACHED_GROUP_KEY);
    if(jsonGroup != null){
      return Future.value(GroupModel.fromMap(json.decode(jsonGroup)));
    }
    else{
      return Future.error('запись не удалась');
    }
  }

  @override
  Future<void> groupToCache(GroupModel group) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final String jsonGroup = json.encode(group.toJson());
    sharedPreferences.setString(Constants.CACHED_GROUP_KEY, jsonGroup);
    print("Запись в кэш $jsonGroup");
    return Future.value(jsonGroup);
  }
  
}