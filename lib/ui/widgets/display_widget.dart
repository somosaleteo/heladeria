import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    required this.label,
    required this.counter,
    super.key,
  });
  final String label;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InlineTextWidget(
          'Hemos tardado $label milisegundos',
        ),
        Text(
          '$counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
