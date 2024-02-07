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
  int comparisonId = 0;
  bool finished = false;
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
      currentId = labelsId[i];
      currentIndex = i;
      for (int j = i + 1; j < labelsId.length; j++) {
        comparisonId = labelsId[j];
        await Future<void>.delayed(
            Duration(
              milliseconds: comparisonId <= currentId ? 500 : 250,
            ), () {
          setState(() {});
        });
        if (comparisonId <= currentId) {
          labelsId[currentIndex] = comparisonId;
          labelsId[j] = currentId;
          currentId = comparisonId;
        }
      }

      orderedLabelsId.clear();
      orderedLabelsId.addAll(labelsId);
      await Future<void>.delayed(const Duration(milliseconds: 500), () {
        setState(() {});
      });
    }
    orderedLabelsId.removeAt(0);
    finished = true;
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
      label: '$comparisonId',
      color: comparisonId <= currentId ? Colors.green : Colors.orangeAccent,
    );
    final List<LabelWidget> labels = _labelsPrinter(orderedLabelsId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Taller 3'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            '${widget.labelsId.length} etiquetas de proveedor a organizar',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              currentLabel,
              currentIndexLabel,
              comparisonValueLabel,
            ],
          ),
          Text(
            'Hemos desperdiciado ${trash.length} etiquetas',
          ),
          Text(
            finished
                ? 'tardamos $duration ms en completar la tarea'
                : 'Organizando, han transcurrido $duration ms ...',
            style: finished
                ? const TextStyle(color: Colors.green, fontSize: 30)
                : null,
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
