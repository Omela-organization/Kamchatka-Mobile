import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_app/features/violation/ui/violation_modal.dart';
import 'package:green_app/features/feedback/ui/feedback_modal.dart';


class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Оцени маршрут'),
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const RouteModalBody(),
              ),
            ),
            ListTile(
              title: const Text('Отправь сообщение об экологическом нарушении'),
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const ViolationSendModalBody(),
              ),
            ),
            // ListTile(
            //   title: const Text('Посмотри свои заявки'),
            //   onTap: () => showModalBottomSheet(
            //     isScrollControlled: true,
            //     context: context,
            //     builder: (context) => ModalBody(title: 'Заявки', bodyWidget: [
            //       StreamBuilder<List<RegistrationFormEntry>>(
            //         stream: context
            //             .read<RouteRegistrationFormNotifier>()
            //             .watchForms(),
            //         builder: (context, snapshot) {
            //           if (snapshot.hasError) {
            //             return Text(
            //               'Хьюстон у нас проблемы',
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleLarge
            //                   ?.copyWith(color: Colors.red),
            //             );
            //           } else if (snapshot.hasData) {
            //             print('snapshot_data: ${snapshot.data}');
            //             return Column(
            //               children:
            //                   snapshot.data!.map((e) => Text(e.phone)).toList(),
            //             );
            //             //   Text(
            //             //   'Хьюстон у нас нет проблем',
            //             //   style: Theme.of(context)
            //             //       .textTheme
            //             //       .titleLarge
            //             //       ?.copyWith(color: Colors.green),
            //             // );
            //           }
            //           return Text(
            //             'Я хз что это вообще',
            //             style: Theme.of(context).textTheme.titleLarge,
            //           );
            //         },
            //       ),
            //     ]),
            //   ),
            // )
          ],
        ),
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
