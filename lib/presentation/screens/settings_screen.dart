import 'package:dstu_helper/bloc/local_group/group_local_bloc.dart';
import 'package:dstu_helper/presentation/screens/list_group_screen.dart';
import 'package:dstu_helper/presentation/widgets/CardGroupWidget.dart';
import 'package:dstu_helper/presentation/widgets/info_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Uri _url = Uri.parse(
      'https://docs.google.com/forms/d/e/1FAIpQLScYJ2UbmIB9J7qD0zBdmLca7L7rgZO1XBcapVo3GewwI6UtMw/viewform?usp=sf_link');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  BlocBuilder<GroupLocalBloc, GroupLocalState>(
                      builder: (context, state) {
                    if (state is GroupLocalLoading) {
                      context.read<GroupLocalBloc>().add(LoadGroupsFromCache());
                      return const Center(
                        child: Text("Выберете группу"),
                      );
                    }
                    if (state is GroupLocalLoaded) {
                      return CardGroupWidget(
                          group: "${state.group.group}",
                          corpus: '${state.group.corpus}',
                          degree: "${state.group.degree}",
                          course: "${state.group.course}");
                    } else {
                      return const Center(child: Text("EERRRROR"));
                    }
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //context.read<GroupBloc>().add(LoadGroups());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListGroupScreen(),
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFFF7B78C),
                              Color(0xFFEF7663),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Выбрать группу',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppInfoWidget(),
                  const Divider(),
                  const Text(
                    'Нашли ошибку или есть вопросы?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(
                        width: 1,
                        color: Color(0xFFEF7663),
                        style: BorderStyle.solid,
                      )),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.forum_outlined,
                          color: Color(0xFFEF7663),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Поддержка',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if (!await launchUrl(_url))
                        throw 'Could not launch $_url';
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
