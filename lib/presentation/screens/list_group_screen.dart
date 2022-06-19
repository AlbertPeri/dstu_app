import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dstu_helper/bloc/local_group/group_local_bloc.dart';
import 'package:dstu_helper/models/group_model.dart';
import 'package:dstu_helper/repositories/group_local_data/group_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/firestore.dart';

class ListGroupScreen extends StatefulWidget {
  const ListGroupScreen({Key? key}) : super(key: key);

  @override
  State<ListGroupScreen> createState() => _ListGroupScreenState();
}

class _ListGroupScreenState extends State<ListGroupScreen> {
  late GroupLocalBloc groupLocalBloc;
  final groupsQuery = FirebaseFirestore.instance.collection('groups');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FirestoreQueryBuilder(
          query: groupsQuery,
          builder: (context, snapshot, _) {
            if (snapshot.isFetching) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Icon(
                  Icons.error,
                  size: 70,
                  color: Colors.red,
                ),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${snapshot.docs[index]['group']}"),
                    onTap: () async {
                      if (snapshot.docs[index]['course'] != 999) {
                        GroupModel groupModel = GroupModel.fromSnapshot(snapshot.docs[index]);
                        groupLocalBloc = GroupLocalBloc(
                            groupLocalRepository: GroupLocalRepository(),
                            groupModel: groupModel)
                          ..add(
                            WriteGroupToCache(groupModel),
                          );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              'Группа выбрана!',
                              style: TextStyle(fontSize: 20),
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                        context
                            .read<GroupLocalBloc>()
                            .add(LoadGroupsFromCache());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Ошибка!',
                              style: TextStyle(fontSize: 20),
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                      Navigator.pop(context, index);
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: snapshot.docs.length);
          },
        ),
      ),
    );
  }
}
// BlocBuilder<GroupBloc, GroupState>(
// builder: (context, state) {
// if (state is GroupLoading) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
// if (state is GroupLoaded) {
// return ListView.separated(
// itemBuilder: (context, index) {
// return ListTile(
// title: Text("${state.groups[index].group}"),
// onTap: () async {
// if(state.groups[index].course != 999){
// groupLocalBloc = GroupLocalBloc(
// groupLocalRepository: GroupLocalRepository(),
// groupModel: state.groups[index])
// ..add(
// WriteGroupToCache(state.groups[index]),
// );
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// backgroundColor: Colors.green,
// content: Text(
// 'Группа выбрана!',
// style: TextStyle(fontSize: 20),
// ),
// duration: Duration(seconds: 1),
// ),
// );
// context.read<GroupLocalBloc>().add(LoadGroupsFromCache());
// }
// else{
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// backgroundColor: Colors.red,
// content: Text(
// 'Ошибка!',
// style: TextStyle(fontSize: 20),
// ),
// duration: Duration(seconds: 1),
// ),
// );
// }
// Navigator.pop(context, index);
// },
// );
// },
// separatorBuilder: (context, index) => const Divider(),
// itemCount: state.groups.length);
// } else {
// return const Center(
// child: Icon(
// Icons.error,
// size: 70,
// color: Colors.red,
// ),
// );
// }
// },
// ),
