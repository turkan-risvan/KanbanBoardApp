class Kanban {
  int? id;
  String isim;
  String aciklama;
  DateTime olusturulmaTarihi;
  int kategori;

  Kanban(this.isim, this.aciklama, this.olusturulmaTarihi, this.kategori);

  Kanban.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        isim = map["isim"],
         aciklama = map["aciklama"],
        olusturulmaTarihi = DateTime.fromMillisecondsSinceEpoch(map["olusturulmaTarihi"]),
        kategori = map["kategori"] ?? 0;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "isim": isim,
      "aciklama":aciklama,
      "olusturulmaTarihi": olusturulmaTarihi.millisecondsSinceEpoch,
      "kategori": kategori,
    };
  }
}
