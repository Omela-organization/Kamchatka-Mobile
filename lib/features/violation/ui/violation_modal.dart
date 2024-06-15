import 'package:flutter/material.dart';
import 'package:green_app/common/ui/modal_body.dart';
import 'package:green_app/resources/resources.dart';

class ViolationSendModalBody extends StatelessWidget {
  const ViolationSendModalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBody(
        title: 'Выберите тип нарушения',
        paddingFromTitle: 20,
        // contentPadding: EdgeInsets.only(bottom: 10),
        bodyWidget: [
          FeedbackMessageWidget(
            title: 'Лесные пожары',
            imagePath: ViolationImages.fire,
            // titleColor: Colors.white,
          ),
          FeedbackMessageWidget(
            leading: Icons.forest,
            title: 'Незаконные вырубки',
            imagePath: ViolationImages.cut,
          ),
          FeedbackMessageWidget(
            leading: Icons.cruelty_free,
            title: 'Браконьерство',
            imagePath: ViolationImages.hunter,
          ),
          FeedbackMessageWidget(
            leading: Icons.delete,
            title: 'Свалочные очаги',
            imagePath: ViolationImages.trash,
          ),
          FeedbackMessageWidget(
            leading: Icons.question_mark,
            title: 'Иное',
            imagePath: ViolationImages.another,
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
    this.minHeight = 115,
    this.minWidth = 110,
    required this.imagePath,
  })  : titleColor = titleColor.withOpacity(0.9),
        backgroundColor = backgroundColor ?? const Color(0xFFEEF2E3);
  final String title;
  final Color backgroundColor;
  final Color? titleColor;
  final IconData? leading;
  final double minHeight;
  final double minWidth;

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () => (),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ColoredBox(
                color: backgroundColor,
                child: Image.asset(
                  imagePath,
                  // width: minWidth / 2,
                  // height: minHeight,
                ),
              ),
            ),
            Flexible(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: minHeight,
                minWidth: minWidth / 2,
              ),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Center(
                      child: Text(
                    title,
                    textAlign: TextAlign.center,
                  ))),
            )),
          ],
        ),
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
