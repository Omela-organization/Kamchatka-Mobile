import 'package:flutter/material.dart';
import 'package:green_app/feedback_modal.dart';
import 'package:green_app/route_modal.dart';
import 'package:green_app/stars_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: const Text('Оцени маршрут'),
            onTap: () =>
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const RouteModalBody(),
                ),
          ),
          ListTile(
            title: const Text('Отправь сообщение об экологическом нарушении'),
            onTap: () =>
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const FeedbackModalBody(),
                ),
          )
        ],
      ),
    );
  }
}

// class InputExpressionWidget extends StatefulWidget {
//   const InputExpressionWidget({super.key});
//
//   @override
//   State<InputExpressionWidget> createState() => _InputExpressionWidgetState();
// }
//
// class _InputExpressionWidgetState extends State<InputExpressionWidget> {
//   final controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//     );
//   }
// }




