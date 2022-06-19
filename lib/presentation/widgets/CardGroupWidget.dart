import 'package:flutter/material.dart';

class CardGroupWidget extends StatelessWidget {
  final String group;
  final String corpus;
  final String degree;
  final String course;

  CardGroupWidget(
      {Key? key,
      required this.group,
      required this.corpus,
      required this.degree,
      required this.course})
      : super(key: key);

  static const textStyleCard =
      TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Color(0xFFBCC8B4),
              // Color(0xFF7A999B),
              Color(0xFFF7B78C),
              //Color(0xFFE7E1C4),
              //Color(0xFFBCC8B4),
              // Color(0xFF7A999B),
              Color(0xFFEF7663),
              //Color(0xFFCE93D8),
              // Colors.blue,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Группа $group",
              style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(corpus, style: textStyleCard),
            const SizedBox(
              height: 10,
            ),
            Text(
              degree,
              style: textStyleCard,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Курс $course",
              style: textStyleCard,
            ),
          ],
        ),
      ),
    );
  }
}
