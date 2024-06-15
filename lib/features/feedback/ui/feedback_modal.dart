import 'package:flutter/material.dart';
import 'package:green_app/common/ui/modal_body.dart';

class RouteModalBody extends StatelessWidget {
  const RouteModalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBody(
      title: 'Оцените маршрут',
      bodyWidget: [
        const QuestionBlocWrapper(
          question: 'Как бы Вы оценили живописность маршрута?',
          count: 5,
        ),
        const QuestionBlocWrapper(
          question: 'Как бы Вы оценили чистоту маршрута?',
          count: 5,
        ),
        const QuestionBlocWrapper(
          question:
              'Как бы Вы оценили обустроенность маршрута (указатели, информационные аншлаги)?',
          count: 5,
        ),
        const QuestionBlocWrapper(
          question: 'Насколько соответствовали ожидания Вашему опыту?',
          count: 5,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white.withOpacity(0.9)),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Отправить оценку',
            ),
          ),
        ),
      ],
    );
  }
}

class QuestionBlocWrapper extends StatelessWidget {
  const QuestionBlocWrapper({
    super.key,
    required this.question,
    required this.count,
  });

  final String question;
  final int count;

  @override
  Widget build(BuildContext context) {
    return QuestionBlocWidget(
      question: question,
      count: count,
      activeBackColor: Theme.of(context).primaryColor,
      activeTextColor: Theme.of(context).colorScheme.onPrimary,
      inactiveBackColor: Theme.of(context).colorScheme.onPrimary,
      inactiveTextColor: Theme.of(context).primaryColor,
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
    this.activeBackColor = Colors.green,
    this.activeTextColor = Colors.white,
    this.inactiveBackColor = const Color(0xFF7EAB83),
    this.inactiveTextColor = Colors.green,
  });

  final String question;
  final Color activeBackColor;
  final Color activeTextColor;
  final Color inactiveBackColor;
  final Color inactiveTextColor;
  final EdgeInsets? padding;
  final int count;
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
  void didUpdateWidget(covariant QuestionBlocWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Center(
              child: Text(
            widget.question,
            textAlign: TextAlign.center,
          )),
          const SizedBox(
            height: 10,
          ),
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
                    decoration: BoxDecoration(
                      color: idx + 1 == currentValue
                          ? widget.activeBackColor
                          : widget.inactiveBackColor,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
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
