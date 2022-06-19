//import 'dart:html';
import 'dart:io';
import 'package:dstu_helper/presentation/widgets/CardInfoWidget.dart';
import 'package:dstu_helper/repositories/group/group_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  GroupRepository groupRepository = GroupRepository();
  final Uri _url = Uri.parse('https://edu.dstu.ru/login/index.php');

  void showMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'В разработке (',
          style: TextStyle(fontSize: 20),
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }

  final BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(),
      request: AdRequest());

  @override
  void initState() {
    super.initState();
    //bannerAd.load();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     alignment: Alignment.center,
  //     width: bannerAd.size.width.toDouble(),
  //     height: bannerAd.size.height.toDouble(),
  //     child: AdWidget(
  //       ad: bannerAd,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: GridView(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 22,
                    childAspectRatio: 2),
                children: [
                  CardInfoWidget(
                    iconTile: Icons.newspaper_outlined,
                    tile: 'Новости',
                    onTap: showMessage,
                  ),
                  CardInfoWidget(
                    iconTile: Icons.fastfood_outlined,
                    tile: 'Где поесть?',
                    onTap: showMessage,
                  ),
                  CardInfoWidget(
                    iconTile: Icons.domain_outlined,
                    tile: 'Корпуса',
                    onTap: showMessage,
                  ),
                  CardInfoWidget(
                    iconTile: Icons.group_outlined,
                    tile: 'Факультеты',
                    onTap: showMessage,
                  ),
                  CardInfoWidget(
                    iconTile: Icons.open_in_browser_outlined,
                    tile: 'ЭИОС',
                    onTap: () async {
                      if (!await launchUrl(_url))
                        throw 'Could not launch $_url';
                    },
                  ),
                  CardInfoWidget(
                    iconTile: Icons.calendar_month_outlined,
                    tile: 'Экзамены',
                    onTap: showMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
