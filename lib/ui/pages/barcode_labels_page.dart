import 'package:flutter/material.dart';

import '../widgets/label_widget.dart';

List<LabelWidget> _labelsPrinter(List<int> labelsId) {
  String error = '';
  int _checkNumber = double.maxFinite.floor() * -1;
  final List<LabelWidget> labels = <LabelWidget>[];

  for (final int element in labelsId) {
    if (element >= _checkNumber) {
      _checkNumber = element;
      labels.add(
        LabelWidget(
          label: element.toString(),
          color: Colors.orangeAccent,
        ),
      );
    } else {
      error = '⚠';
      labels.add(
        LabelWidget(
          label: error,
          color: Colors.red,
        ),
      );
    }
  }
  return labels;
}

class BarcodeLabelsPage extends StatefulWidget {
  const BarcodeLabelsPage({
    this.labelsId = const <int>[
      6,
      7,
      8,
      9,
      0,
      1,
    ],
    super.key,
  });

  final List<int> labelsId;

  @override
  State<BarcodeLabelsPage> createState() => _BarcodeLabelsPageState();
}

class _BarcodeLabelsPageState extends State<BarcodeLabelsPage> {
  late DateTime startDate;
  int currentId = 0;
  int currentIndex = 0;
  final List<int> trash = <int>[];
  final List<int> orderedLabelsId = <int>[];
  bool isStarted = false;
  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
  }

  Future<void> orderLabelsId() async {
    final List<int> labelsId = <int>[
      double.maxFinite.floor() * -1,
      ...widget.labelsId,
    ];
    currentIndex = 1;
    for (int i = 1; i < labelsId.length; i++) {
      if (labelsId[i] == labelsId[i - 1]) {
        continue;
      } else if (labelsId[i] > labelsId[i - 1]) {}
      currentId = labelsId[i];
      currentIndex = i;
      // orderedLabelsId.add(currentId);
      orderedLabelsId.clear();
      orderedLabelsId.addAll(labelsId);
      await Future<void>.delayed(const Duration(milliseconds: 500), () {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isStarted) {
      orderLabelsId();
      isStarted = true;
    }
    final int duration = DateTime.now().difference(startDate).inMilliseconds;

    final Widget currentLabel = LabelWidget(
      label: '$currentId',
      color: Colors.green,
    );
    final Widget currentIndexLabel = LabelWidget(
      label: '$currentIndex',
      color: Colors.purpleAccent,
    );
    final Widget comparisonValueLabel = LabelWidget(
      label: '${orderedLabelsId[currentIndex]}',
      color: Colors.orangeAccent,
    );
    final List<LabelWidget> labels = _labelsPrinter(orderedLabelsId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Taller 3'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Etiquetas de proveedor: ${widget.labelsId}',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              currentLabel,
              currentIndexLabel,
              comparisonValueLabel
            ],
          ),
          Text(
            'Hemos desperdiciado ${trash.length} etiquetas',
          ),
          Text(
            'tardamos $duration ms en completar la tarea',
          ),
          Expanded(
            child: Row(
              children: labels,
            ),
          )
        ],
      ),
    );
  }
}
