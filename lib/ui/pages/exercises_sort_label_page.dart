import 'package:flutter/material.dart';

import '../../exercises/labels/junior/medium_one.dart';
import '../../exercises/labels/master/insane_one.dart';
import '../../exercises/labels/senior/hard_one.dart';
import '../../exercises/labels/trainee/easy_one.dart';
import '../widgets/navigation_tile_widget.dart';
import 'barcode_labels_page.dart';

class ExercisesSortLabelPage extends StatelessWidget {
  const ExercisesSortLabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba hasta que nivel puedes llegar 🏆'),
      ),
      body: ListView(
        children: const <Widget>[
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: <int>[0, 5, 6, 7, 8, 9, 1, 2, 4, 3],
            ),
            title: 'Taller 3',
            description: 'Finalizacion tutoria',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: easy0,
            ),
            title: 'Trainee',
            description: 'Ejercicio 1',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: easy1,
            ),
            title: 'Trainee',
            description: 'Ejercicio 2',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: easy2,
            ),
            title: 'Trainee',
            description: 'Ejercicio 3',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: medium1,
            ),
            title: 'junior',
            description: 'Ejercicio 1',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: medium2,
            ),
            title: 'junior',
            description: 'Ejercicio 2',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: medium3,
            ),
            title: 'junior',
            description: 'Ejercicio 3',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: hard1,
            ),
            title: 'Senior',
            description: 'Ejercicio 1',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: hard2,
            ),
            title: 'Senior',
            description: 'Ejercicio 2',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: hard3,
            ),
            title: 'senior',
            description: 'Ejercicio 3',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: insane1,
            ),
            title: 'Master',
            description: 'Ejercicio 1',
          ),
          NavigationTileWidget(
            page: BarcodeLabelsPage(
              labelsId: insane2,
            ),
            title: 'Master',
            description: 'Ejercicio 2',
          ),
        ],
      ),
    );
  }
}
