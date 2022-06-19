import 'package:flutter/material.dart';

class ScheduleOfDayWidget extends StatelessWidget {
  final String lesson;
  final String index;
  final String teacher;
  final String room;
  final String type;
  final List<Color> colorsIndex = [
    Color(0xFFEF7663),
    Color(0xFFF7B78C),
    Color(0xFFE7E1C4),
    Color(0xFFBCC8B4),
    Color(0xFF7A999B),
    Color(0xFFF4C84B)
  ];

  ScheduleOfDayWidget(
      {Key? key,
      required this.lesson,
      required this.index,
      required this.teacher,
      required this.room,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        elevation: 0,
        shadowColor: colorsIndex[int.parse(index) - 1],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              decoration: BoxDecoration(
                color: colorsIndex[int.parse(index) - 1],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: Center(
                child: Text(
                  "${index}",
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${lesson}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.school_outlined,
                      color: Color(0xFF7F8E9D),
                      size: 22.5,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${teacher}",
                      style: const TextStyle(
                          color: Color(0xFF7F8E9D), fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.door_front_door_outlined,
                      color: Color(0xFF7F8E9D),
                      size: 22.5,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${room}",
                      style: const TextStyle(
                          color: Color(0xFF7F8E9D), fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outlined,
                      color: Color(0xFF7F8E9D),
                      size: 22.5,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${type}",
                      style: const TextStyle(
                          color: Color(0xFF7F8E9D), fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
