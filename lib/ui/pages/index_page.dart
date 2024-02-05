import 'package:flutter/material.dart';

import '../widgets/navigation_tile_widget.dart';
import 'barcode_labels_page.dart';
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
            page: BarcodeLabelsPage(
              labelsId: <int>[0, 5, 6, 7, 8, 9, 1, 2, 4, 3],
            ),
            title: 'Taller 3',
            description: 'Corresponde al taller # 3',
          ),
        ],
      ),
    );
  }
}
