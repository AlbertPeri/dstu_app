import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {

  final IconData iconTile;
  final String tile;
  final GestureTapCallback? onTap;

  CardInfoWidget(
      {Key? key, required this.iconTile, required this.tile, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 190,
        height: 85,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: const [
              Color(0xFFF7B78C),
              Color(0xFFEF7663),
            ],
          ),
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
         // border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid),,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconTile, size: 45, color: Colors.white,),
            Text(tile, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
