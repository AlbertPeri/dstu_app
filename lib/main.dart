import 'package:dstu_helper/bloc/local_group/group_local_bloc.dart';
import 'package:dstu_helper/presentation/screens/info_screen.dart';
import 'package:dstu_helper/presentation/screens/schedule_screen.dart';
import 'package:dstu_helper/presentation/screens/settings_screen.dart';
import 'package:dstu_helper/repositories/group/group_repository.dart';
import 'package:dstu_helper/repositories/group_local_data/group_local_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/group/group_bloc.dart';
import 'models/group_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 1;
  static const List<Widget> _screenList = <Widget>[
    InfoScreen(),
    ScheduleScreen(),
    SettingsScreen()
  ];
  GroupModel emptyModel = GroupModel(
      corpus: "no", degree: "no", course: 0, schedules: [], group: 'no');

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GroupBloc(groupRepository: GroupRepository())..add(LoadGroups()),
        ),
        BlocProvider(
          create: (context) => GroupLocalBloc(
              groupLocalRepository: GroupLocalRepository(),
              groupModel: emptyModel)
            ..add(LoadGroupsFromCache()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleSpacing: 10,
            centerTitle: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          fontFamily: 'Rubik',
          primaryColor: const Color(0xFF4DC591),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFFEF7663),
          ),
        ),
        home: Scaffold(
          body: Container(
            child: _screenList[_selectedTab],
          ),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                  indicatorColor: Color(0xFF4DC591),
              backgroundColor: Colors.white,
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                ),
              ),
              iconTheme: MaterialStateProperty.all(
                IconThemeData(
                  color: Colors.white
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: _selectedTab,
              onDestinationSelected: onSelectTab,
              //backgroundColor: Color(0xFF4DC591),
              animationDuration: Duration(seconds: 1),

              destinations: [
                NavigationDestination(
                  selectedIcon: Icon(Icons.help,),
                  icon: Icon(Icons.help_outline_outlined, color: Colors.black,),
                  label: 'Инфо',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.calendar_month,),
                  icon: Icon(Icons.calendar_month_outlined,color: Colors.black,),
                  label: 'Расписание',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.settings,),
                  icon: Icon(Icons.settings_outlined,color: Colors.black,),
                  label: 'Настройки',
                ),
              ],
            ),
            ),

          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: _selectedTab,
          //   onTap: onSelectTab,
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.help), label: "Инфо"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.calendar_month), label: "Расписание"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.settings), label: "Настройки"),
          //   ],
          // ),
        ),
      ),
    );
  }
}
