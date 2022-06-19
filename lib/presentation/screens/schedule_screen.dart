import 'package:dstu_helper/bloc/local_group/group_local_bloc.dart';
import 'package:dstu_helper/models/group_model.dart';
import 'package:dstu_helper/presentation/widgets/schedule_of_day_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  static const List<String> txtDay = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
  static const List<String> txtFullDay = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье'
  ];
  int selectDay = DateTime
      .now()
      .weekday;
  int day = DateTime
      .now()
      .day;
  int selectWeek = 0;
  late TabController _tabController;

  List<DayWeek>? dayList(GroupLocalLoaded state, int weekday, int week) {
    //int weekday = DateTime.now().weekday;
    switch (weekday) {
      case 1:
        return state.group.schedules![week].monday;
      case 2:
        return state.group.schedules![week].tuesday;
      case 3:
        return state.group.schedules![week].wednesday;
      case 4:
        return state.group.schedules![week].thursday;
      case 5:
        return state.group.schedules![week].friday;
      case 6:
        return state.group.schedules![week].saturday;
      case 7:
        return state.group.schedules![week].monday;
      default:
        return state.group.schedules![week].monday;
    }
  }

  void selectedDay(int index) {
    selectDay = index;
    print(index);
  }

  void selectedWeek() {
    if (selectWeek == 0) {
      setState(() {
        selectWeek = 1;
      });
    } else {
      setState(() {
        selectWeek = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 7, initialIndex: selectDay - 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: BlocBuilder<GroupLocalBloc, GroupLocalState>(
        builder: (context, state) {
          if (state is GroupLocalLoaded) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: Text(
                    'Группа ${state.group.group}',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w700,color: Colors.black),
                  ),
                  actions: [
                    if (selectWeek == 0) ...[
                      Center(
                        child: const Text(
                          '1-3 неделя',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                    if (selectWeek == 1) ...[
                      Center(
                        child: const Text(
                          '2-4 неделя',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                    IconButton(
                      onPressed: () {
                        selectedWeek();
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xFFEF7663),
                      ),
                      tooltip: 'Посмотреть другую неделю',
                      iconSize: 30,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return ActionChip(
                          label: Text(txtDay[index]),
                          onPressed: () {
                            setState(() {
                              selectedDay(index + 1);
                            });
                          },
                          tooltip: "День недели",
                          backgroundColor: index + 1 == selectDay
                              ? const Color(0xFFEF7663)
                              : Colors.black12,
                          labelStyle: const TextStyle(color: Colors.white),
                        );
                      },
                      itemCount: 6,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 15,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ScheduleOfDayWidget(
                          lesson:
                              dayList(state, selectDay, selectWeek)![index]
                                  .lesson
                                  .toString(),
                          index: dayList(state, selectDay, selectWeek)![index]
                              .index
                              .toString(),
                          room: dayList(state, selectDay, selectWeek)![index]
                              .room
                              .toString(),
                          teacher:
                              dayList(state, selectDay, selectWeek)![index]
                                  .teacher
                                  .toString(),
                          type: dayList(state, selectDay, selectWeek)![index]
                              .type
                              .toString(),
                        ),
                      );
                    },
                    childCount: dayList(state, selectDay, selectWeek)!.length,
                  ),
                ),
              ],
            );
          }
          if (state is GroupLocalLoading) {
            return const Center(
              child: Text('Выберете группу во вкладке настройки'),
            );
          } else {
            return Center(
              child: Text("Ошибка!"),
            );
          }
        },
      ),
    ),
  );
}
}
