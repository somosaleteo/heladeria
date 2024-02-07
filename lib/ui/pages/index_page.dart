import 'package:flutter/material.dart';

import '../widgets/navigation_tile_widget.dart';
import 'exercises_sort_label_page.dart';
import 'my_home_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recepción'),
      ),
      body: ListView(
        children: const <Widget>[
          NavigationTileWidget(
            page: MyHomePage(title: 'Taller 1 y 2 - Ejemplos'),
            title:
                'Talleres previos -> loreTalleres previos -> loreTalleres previos -> loreTalleres previos -> loreTalleres previos -> loreTalleres previos -> loreTalleres previos -> loreTalleres previos -> loreTalleres previos -> lore',
            description:
                'Aqui encontraremos la informacion de los primeros dos talleres, Aqui encontraremos la informacion de los primeros dos talleres, Aqui encontraremos la informacion de los primeros dos talleres, ',
          ),
          NavigationTileWidget(
            page: ExercisesSortLabelPage(),
            title: 'Ejercicios agrupados',
            description:
                'Modifica el código de la página barcode_labes_page.dart para cumplir con el ordenamiento de todas las etiquetas.',
          ),
        ],
      ),
    );
  }
}
