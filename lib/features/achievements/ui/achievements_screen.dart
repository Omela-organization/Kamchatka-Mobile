import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_app/resources/resources.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(GreenAchievments.green11);
    _checkIfAssetExists(GreenAchievments.green11);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // SvgPicture.asset('assets/achievments/green/green_11.svg'),

            AchievementRowWidget(
                image: Image.asset(Achievments.gray11),
                label: 'Зеленый новичок'),
            AchievementRowWidget(
                image: Image.asset(Achievments.gray12),
                label: 'Маленький исследователь'),
            AchievementRowWidget(
                image: Image.asset(Achievments.green21), label: 'Юный защитник'),

          ],
        ),
      ),
    );
  }

  Future<bool> _checkIfAssetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      print('exist;');
      return true;
    } catch (e) {
      print('doesnot exist');
      return false;
    }
  }
}

class AchievementRowWidget extends StatelessWidget {
  const AchievementRowWidget({
    super.key,
    required this.image,
    required this.label,
  });

  final Widget image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width / 2, child: image),

          Flexible(
            child: Text(
                        label,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
          ),
          // Text('Отправка первого сообщения о нарушении'),
        ],
      ),
    );
  }
}
