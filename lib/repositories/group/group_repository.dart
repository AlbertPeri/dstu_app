import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/group_model.dart';
import 'base_group_repository.dart';

class GroupRepository extends BaseGroupRepository {
  final FirebaseFirestore _firebaseFirestore;

  GroupRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<GroupModel>> getAllGroups() {
    return _firebaseFirestore.collection('groups').snapshots().map((snapshot) {
      print("${snapshot.docs.map((doc) => GroupModel.fromSnapshot(doc)).toList().toString()} + CHECK ");
      return snapshot.docs.map((doc) => GroupModel.fromSnapshot(doc)).toList();
    });
  }
}