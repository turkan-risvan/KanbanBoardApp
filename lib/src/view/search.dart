import 'package:flutter/material.dart';
import 'package:kanbanboardapp/src/model/kanban_model.dart';
import 'package:kanbanboardapp/src/view/card_detay.dart';

class KanbanAramaDelegate extends SearchDelegate {
  final List<Kanban> kanbanlar;

  KanbanAramaDelegate(this.kanbanlar);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

@override
Widget buildResults(BuildContext context) {
  final List<Kanban> sonuclar = kanbanlar
      .where((kanban) =>
          kanban.isim.toLowerCase().contains(query.toLowerCase()))
      .toList();

  return ListView.builder(
    itemCount: sonuclar.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(sonuclar[index].isim),
        onTap: () {
          // Burada seçilen kitaba tıklanınca yapılacak işlemleri ekleyebilirsiniz.
          // Örneğin, detay sayfasına gitmek gibi.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CardDetay(),
            ),
          );
        },
      );
    },
  );
}

@override
Widget buildSuggestions(BuildContext context) {
  final List<Kanban> oneriler = kanbanlar
      .where((kanban) =>
          kanban.isim.toLowerCase().startsWith(query.toLowerCase()))
      .toList();

  return ListView.builder(
    itemCount: oneriler.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(oneriler[index].isim),
        onTap: () {
          // Burada önerilen kitaba tıklanınca yapılacak işlemleri ekleyebilirsiniz.
          // Örneğin, detay sayfasına gitmek gibi.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CardDetay(),
            ),
          );
        },
      );
    },
  );
}

}