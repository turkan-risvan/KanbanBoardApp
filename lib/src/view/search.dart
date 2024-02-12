
import 'package:flutter/material.dart';
import 'package:kanbanboardapp/src/model/kanban_model.dart';
import 'package:kanbanboardapp/src/view/card_detay.dart';

class KanbanAramaDelegate extends SearchDelegate {
  final List<Kanban> kanbanlar;

  // KanbanAramaDelegate sınıfının constructor'ı
  KanbanAramaDelegate(this.kanbanlar);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Arama çubuğundaki temizleme ve iptal butonları
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Arama sorgusunu temizle
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Geri butonu
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Arama sayfasını kapat
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Arama sonuçları sayfasını oluştur
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
            // Seçilen kanban'a tıklanınca yapılacak işlemleri ekleyebilirsiniz.
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
    // Arama önerileri sayfasını oluştur
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
            // Önerilen kanban'a tıklanınca yapılacak işlemleri ekleyebilirsiniz.
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