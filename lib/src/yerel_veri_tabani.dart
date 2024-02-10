import 'dart:async';

import 'package:kanbanboardapp/src/model/kanban_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 

class YerelVeriTabani {
  YerelVeriTabani._privateConstructor();

  static final YerelVeriTabani _nesne = YerelVeriTabani._privateConstructor();

  factory YerelVeriTabani() {
    return _nesne;
  }

  Database? _veriTabani;

  final String _kanbanlarTabloAdi = "kanbanlar";
  final String _idKanbanlar = "id";
  final String _isimKanbanlar = "isim";
   final String _aciklamaKanbanlar = "aciklama";
  final String _olusturulmaTarihiKanbanlar = "olusturulmaTarihi";
  final String _kategoriKanbanlar = "kategori";

 

  Future<Database?> _veriTabaniniGetir() async {
    if (_veriTabani == null) {
      String dosyaYolu = await getDatabasesPath();
      String veriTabaniYolu = join(dosyaYolu, "kanban.db");
      _veriTabani = await openDatabase(
        veriTabaniYolu,
        version: 5,
        onCreate: _tabloOlustur,
        onUpgrade: _tabloGuncelle,
      );
    }
    return _veriTabani;
  }

  Future<void> _tabloOlustur(Database db, int versiyon) async {
    await db.execute("""
      CREATE TABLE $_kanbanlarTabloAdi (
        $_idKanbanlar	INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
        $_isimKanbanlar	TEXT NOT NULL,
        $_aciklamaKanbanlar	TEXT NOT NULL,
        $_olusturulmaTarihiKanbanlar INTEGER,
        $_kategoriKanbanlar	INTEGER DEFAULT 0
      );
      """);
 
  }

  Future<void> _tabloGuncelle(
    Database db,
    int eskiVersiyon,
    int yeniVersiyon,
  ) async {
    List<String> guncellemeKomutlari = [];

    for (int i = eskiVersiyon - 1; i < yeniVersiyon - 1; i++) {
      await db.execute(guncellemeKomutlari[i]);
    }
  }

  // CRUD Operasyonları
  // Create, Read, Update, Delete
  // Oluştur, Oku, Güncelle, Sil

  Future<int> createKanban(Kanban kanban) async {
    Database? db = await _veriTabaniniGetir();
    if (db != null) {
      return await db.insert(_kanbanlarTabloAdi, kanban.toMap());
    } else {
      return -1;
    }
  }

  Future<List<Kanban>> readTumKanbanlar(int kategoriId, int sonKanbanId) async {
    Database? db = await _veriTabaniniGetir();
    List<Kanban> kanbanlar = [];

    if (db != null) {
      // && -> and
      // || -> or
      // filtre = "$_kategoriKitaplar = ? and $_idKitaplar > ?";
      // filtre = "$_kategoriKitaplar = ? or $_idKitaplar > ? or $_idKitaplar == ?";

      String filtre = "$_idKanbanlar > ?";
      List<dynamic> filtreArgumanlari = [sonKanbanId];

      if (kategoriId >= 0) {
        filtre += " and $_kategoriKanbanlar = ?";
        filtreArgumanlari.add(kategoriId);
      }

      List<Map<String, dynamic>> kanbanlarMap = await db.query(
        _kanbanlarTabloAdi,
        where: filtre,
        whereArgs: filtreArgumanlari,
        orderBy: _idKanbanlar,
        limit: 15,
        // orderBy: "$_kategoriKitaplar desc, $_isimKitaplar asc",
        // orderBy: "$_isimKitaplar collate localized",
      );
      for (Map<String, dynamic> m in kanbanlarMap) {
        Kanban k = Kanban.fromMap(m);
        kanbanlar.add(k);
      }
    }

    return kanbanlar;
  }

  Future<int> updateKanban(Kanban kanban) async {
    Database? db = await _veriTabaniniGetir();
    if (db != null) {
      return await db.update(
        _kanbanlarTabloAdi,
        kanban.toMap(),
        where: "$_idKanbanlar = ?",
        whereArgs: [kanban.id],
      );
    } else {
      return 0;
    }
  }

  Future<int> deleteKanban(Kanban kanban) async {
    Database? db = await _veriTabaniniGetir();
    if (db != null) {
      return await db.delete(
        _kanbanlarTabloAdi,
        where: "$_idKanbanlar = ?",
        whereArgs: [kanban.id],
      );
    } else {
      return 0;
    }
  }

  Future<int> deleteKanbanlar(List<int> kanbanIdleri) async {
    Database? db = await _veriTabaniniGetir();
    if (db != null && kanbanIdleri.isNotEmpty) {
      String filtre = "$_idKanbanlar in (";

      for (int i = 0; i < kanbanIdleri.length; i++) {
        if (i != kanbanIdleri.length - 1) {
          filtre += "?,";
        } else {
          filtre += "?)";
        }
      }

      return await db.delete(
        _kanbanlarTabloAdi,
        where: filtre,
        whereArgs: kanbanIdleri,
      );
    } else {
      return 0;
    }
  }

 
 

   
  }

 

 
 
