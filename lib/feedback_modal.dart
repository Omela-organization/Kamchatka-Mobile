import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:green_app/modal_body.dart';

class FeedbackModalBody extends StatelessWidget {
  const FeedbackModalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBody(
        title: 'Отправьте сообщение об экологическом нарушении',
        paddingFromTitle: 20,
        // contentPadding: EdgeInsets.only(bottom: 10),
        bodyWidget: [
          FeedbackMessageWidget(
            leading: Icons.local_fire_department,
            title: 'Лесные пожары',
            backgroundColor: Colors.deepOrange,
            // titleColor: Colors.white,
          ),
          FeedbackMessageWidget(
            leading: Icons.forest,
            title: 'Незаконные вырубки',
            backgroundColor: Colors.green,
          ),
          FeedbackMessageWidget(
            leading: Icons.cruelty_free,
            title: 'Браконьерство',
            backgroundColor: Colors.brown,
          ),
          FeedbackMessageWidget(
            leading: Icons.delete,
            title: 'Свалочные очаги',
            backgroundColor: Colors.black,
          ),
          FeedbackMessageWidget(
            leading: Icons.question_mark,
            title: 'Иное',
            backgroundColor: Colors.blue,
          ),
        ]);
  }
}

class FeedbackMessageWidget extends StatelessWidget {
  FeedbackMessageWidget({
    super.key,
    required this.title,
    Color? backgroundColor,
    Color titleColor = Colors.white,
    this.leading,
    this.minHeight = 30,
  })  : this.titleColor = titleColor.withOpacity(0.9),
        this.backgroundColor = backgroundColor?.withOpacity(0.7);

  final String title;
  final Color? backgroundColor;
  final Color? titleColor;
  final IconData? leading;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ListTile(
        minVerticalPadding: minHeight,
        leading: Icon(leading, color: titleColor),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: titleColor),
        ),
        tileColor: backgroundColor,
      ),
    );
  }

// Color? getContrastColor(Color? color) {
//   if (color == null) {
//     return null;
//   }
//   // Инвертируем цвет
//   return Color.fromARGB(
//     color.alpha,
//     255 - color.red,
//     255 - color.green,
//     255 - color.blue,
//   );
// }
}
