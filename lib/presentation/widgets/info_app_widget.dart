import 'package:flutter/material.dart';

class AppInfoWidget extends StatelessWidget {
  const AppInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
         Text(
          'Информация о приложении:',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 10,
        ),
         Text(
          'Приложение ДГТУ, cозданное, чтобы облегчить доступ к расписанию и другой информации.',
          style: TextStyle(color: Colors.black),
        ),
         SizedBox(
          height: 10,
        ),
         Text(
          'Версия:',
          style: TextStyle(color: Colors.grey),
        ),
         SizedBox(
          height: 10,
        ),
         Text(
          '1.0.0 - beta',
          style: TextStyle(color: Colors.black),
        ),
         SizedBox(
          height: 10,
        ),
         Text(
          'Разработчик:',
          style: TextStyle(color: Colors.grey),
        ),
         SizedBox(
          height: 10,
        ),
         Text(
          'Гусейнов Альберт\nhttps://t.me/alertboy',
          style: TextStyle(color: Colors.black),
        ),
         SizedBox(
          height: 10,
        ),
         Text(
          'Помощники:',
          style: TextStyle(color: Colors.grey),
        ),
         SizedBox(
          height: 10,
        ),
         Text(
          'Аминов Магомед',
          style: TextStyle(color: Colors.black),
        ),
         Text(
          'Омаров Абдулхалик',
          style: TextStyle(color: Colors.black),
        ),
         SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
