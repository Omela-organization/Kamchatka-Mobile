import 'package:flutter/material.dart';
import 'package:green_app/modal_body.dart';

class RouteModalBody extends StatelessWidget {
  const RouteModalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBody(
      title: 'Оцените маршрут',
      bodyWidget: [
        const QuestionBlocWidget(
          question: 'Как бы Вы оценили живописность маршрута?',
          count: 5,
        ),
        const QuestionBlocWidget(
          question: 'Как бы Вы оценили чистоту маршрута?',
          count: 5,
        ),
        const QuestionBlocWidget(
          question:
              'Как бы Вы оценили обустроенность маршрута (указатели, информационные аншлаги)?',
          count: 5,
        ),
        const QuestionBlocWidget(
          question:
              'Насколько удобным и комфортным было размещение на маршруте (если было)?',
          count: 5,
        ),
        const QuestionBlocWidget(
          question: 'Насколько соответствовали ожидания Вашему опыту?',
          count: 5,
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Отправить оценку',
          ),
        ),
      ],
    );
  }
}

class QuestionBlocWidget extends StatefulWidget {
  const QuestionBlocWidget({
    super.key,
    required this.question,
    required this.count,
    this.onChanged,
    this.padding,
    this.activeBackColor = Colors.yellow,
    this.activeTextColor = Colors.green,
    this.inactiveBackColor = Colors.green,
    this.inactiveTextColor = Colors.black,
  });

  final String question;
  final Color activeBackColor;
  final Color activeTextColor;
  final Color inactiveBackColor;
  final Color inactiveTextColor;
  final EdgeInsets? padding;

  // final double minValue;
  // final double maxValue;
  final int count;

  // final double startValue;
  final Function(int)? onChanged;

  @override
  State<QuestionBlocWidget> createState() => _QuestionBlocWidgetState();
}

class _QuestionBlocWidgetState extends State<QuestionBlocWidget> {
  late int currentValue;

  @override
  void initState() {
    currentValue = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Center(
              child: Text(
            widget.question,
            textAlign: TextAlign.center,
          )),
          // SizedBox(height: 10,),
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.count,
              separatorBuilder: (context, idx) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (context, idx) {
                return InkWell(
                  onTap: () {
                    setState(() => currentValue = idx + 1);
                    if (widget.onChanged != null) {
                      widget.onChanged!(currentValue);
                    }
                  },
                  child: Container(
                    width: 60,
                    // padding: const EdgeInsets.all(12),
                    color: idx + 1 == currentValue
                        ? widget.activeBackColor
                        : widget.inactiveBackColor,
                    child: Center(
                      child: Text(
                        '${idx + 1}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: idx + 1 == currentValue
                                  ? widget.activeTextColor
                                  : widget.inactiveTextColor,
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
