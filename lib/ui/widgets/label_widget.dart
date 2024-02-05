import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    this.label = '',
    this.color = Colors.transparent,
    super.key,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: InlineTextWidget(
        label,
      ),
    );
  }
}
