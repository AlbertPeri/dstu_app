import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {

  IconData iconTile;
  String tile;
  GestureTapCallback? onTap;

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
