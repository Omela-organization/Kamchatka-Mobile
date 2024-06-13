import 'package:flutter/material.dart';

class ModalBody extends StatelessWidget {
  const ModalBody({
    super.key,
    required this.title,
    this.padding,
    required this.bodyWidget,
    this.onCloseButton,
    this.contentPadding,
    this.paddingFromTitle,
  });

  final String title;
  final EdgeInsets? padding;
  final List<Widget> bodyWidget;
  final VoidCallback? onCloseButton;
  final EdgeInsetsGeometry? contentPadding;
  final double? paddingFromTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            right: 20,
            left: 20,
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Theme.of(context).primaryColor,
              onPressed: onCloseButton ?? () => Navigator.maybePop(context),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: paddingFromTitle),
          Flexible(
            child: ListView(
              padding: contentPadding,
              children: bodyWidget,
            ),
          ),
        ],
      ),
    );
  }
}
