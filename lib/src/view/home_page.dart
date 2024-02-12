import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanbanboardapp/src/model/kanban_model.dart';
import 'package:kanbanboardapp/src/repo/repositories.dart';
import 'package:kanbanboardapp/src/view/alertdialog_page.dart';

import 'package:kanbanboardapp/src/view/card_detay.dart';
import 'package:kanbanboardapp/src/view/search.dart';
import 'package:kanbanboardapp/src/view/user_page.dart';
import 'package:kanbanboardapp/src/database/sqlite_database.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
    // Yerel veritabanı örneği
  YerelVeriTabani yerelVeriTabani = YerelVeriTabani();

  // Kaydırma işlemlerini yönetmek için kullanılan kontrol
  ScrollController scrollController = ScrollController();

// Kanban nesnelerini tutan liste
  static List<Kanban> kanbanlar = [];

// kartının görünürlüğünü belirleyen kısım
  bool isTodoCardVisible = false;
  // Seçilen kategori indeksi
  int secilenKategori = -1;

 // Seçilen Kanban ID'lerini saklamak için liste
  List<int> secilenKanbanIdleri = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildKanbanEkleFab(context),
    );
  }

  // Alt gezinme çubuğunu oluşturan fonksiyon
  Widget buildBottomNavigationBar() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -1), // Y ekseninde yukarı doğru bir gölge
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_filled,
                size: 25,
                color: Colors.grey,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RepositoryProvider(
                              create: (context) => UserRepository(),
                              child: const UserPage(),
                            )),
                  );
                },
                child: const Text(
                  "Word Ninja'ya Git",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ))
          ],
        ),
      ),
    );
  }

// App bar'ı oluşturan fonksiyon
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xff744BFC),
      leadingWidth: 150,
      leading: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          SizedBox(height: 35, width: 75, child: Image.asset("assets/rastmobilelogo.png", color: Colors.white)),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: KanbanAramaDelegate(kanbanlar));
          },
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                        create: (context) => UserRepository(),
                        child: const UserPage(),
                      )),
            );
          },
          icon: const Icon(Icons.settings, color: Colors.white),
        ),
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: seciliKanbanlariSil,
        ),
      ],
    );
  }

// Ekranın gövdesini oluşturan fonksiyon
  Widget buildBody() {
    return FutureBuilder(
      future: ilkKanbanlariGetir(),
      builder: buildReorderableListView,
    );
  }
// ReorderableListView'ı oluşturan fonksiyon
  Widget buildReorderableListView(BuildContext context, AsyncSnapshot<void> snapshot) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildProjectCard("Refactoring for Word Ninja", "New project for refactoring our app Word ninja"),
          buildBacklogSection("Backlog", "4"),
         // Kanbanlar için ReorderableListView
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 200,
            child: ReorderableListView(
              // Bu widget'ı ReorderableListView ile değiştirdik
              scrollController: scrollController,
              scrollDirection: Axis.horizontal,
              onReorder: (int oldIndex, int newIndex) {
                // Elemanların sıralanmasını sağlayan callback
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  Kanban kanban = kanbanlar.removeAt(oldIndex);
                  kanbanlar.insert(newIndex, kanban);
                });
              },
              children: List.generate(
                kanbanlar.length,
                (index) {
                  return buildListItem(context, index);
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          buildBacklogSection("To Do", "8"),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 200,
            child: ReorderableListView(
              // Bu widget'ı ReorderableListView ile değiştirdik
              scrollController: scrollController,
              scrollDirection: Axis.horizontal,
              onReorder: (int oldIndex, int newIndex) {
                // Elemanların sıralanmasını sağlayan callback
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  Kanban kanban = kanbanlar.removeAt(oldIndex);
                  kanbanlar.insert(newIndex, kanban);
                });
              },
              children: List.generate(
                kanbanlar.length,
                (index) {
                  return buildListItem(context, index);
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          buildBacklogSection("In progress", "11"),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 200,
            child: ReorderableListView(
              // Bu widget'ı ReorderableListView ile değiştirdik
              scrollController: scrollController,
              scrollDirection: Axis.horizontal,
              onReorder: (int oldIndex, int newIndex) {
                // Elemanların sıralanmasını sağlayan callback
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  Kanban kanban = kanbanlar.removeAt(oldIndex);
                  kanbanlar.insert(newIndex, kanban);
                });
              },
              children: List.generate(
                kanbanlar.length,
                (index) {
                  return buildListItem(context, index);
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          buildBacklogSection("Done", "3"),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 200,
            child: ReorderableListView(
              // Bu widget'ı ReorderableListView ile değiştirdik
              scrollController: scrollController,
              scrollDirection: Axis.horizontal,
              onReorder: (int oldIndex, int newIndex) {
                // Elemanların sıralanmasını sağlayan callback
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  Kanban kanban = kanbanlar.removeAt(oldIndex);
                  kanbanlar.insert(newIndex, kanban);
                });
              },
              children: List.generate(
                kanbanlar.length,
                (index) {
                  return buildListItem(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

// Bir proje kartı widget'ını oluşturan fonksiyon
  Widget buildProjectCard(String title, String description) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xffDFD5FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/logo.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

 // Backlog bölümünü oluşturan fonksiyon
  Widget buildBacklogSection(String title, String count) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  isTodoCardVisible = true;
                });
              },
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            SizedBox(
              height: 47,
              child: Center(
                child: Text(
                  count,
                  style: const TextStyle(color: Color(0xffD8D8D8), fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

// List item widget'ını oluşturan fonksiyon
  Widget buildListItem(BuildContext context, int index) {
    return Padding(
      key: ValueKey(kanbanlar[index].id),
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CardDetay()));
        },
        child: Container(
          width: 300,
          height: 170,
          child: Stack(
            children: [
              Card(
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.6),
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 3, top: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        // CircleAvatar(
                        //   child: Text(
                        //     kanbanlar[index].id.toString(),
                        //   ),
                        // ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                          ),
                          onPressed: () {
                            kanbanGuncelle(context, index);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Checkbox(
                          value: secilenKanbanIdleri.contains(kanbanlar[index].id),
                          onChanged: (bool? yeniDeger) {
                            if (yeniDeger != null) {
                              int? kanbanId = kanbanlar[index].id;
                              if (kanbanId != null) {
                                setState(() {
                                  if (yeniDeger) {
                                    secilenKanbanIdleri.add(kanbanId);
                                  } else {
                                    secilenKanbanIdleri.remove(kanbanId);
                                  }
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    Text(
                      kanbanlar[index].isim,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 50,
                      child: Text(
                        maxLines: 3,
                        kanbanlar[index].aciklama,
                        style: const TextStyle(
                          color: Color(0xff707070),
                          fontSize: 9,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 17,
                          backgroundImage: AssetImage("assets/image.png"),
                        ),
                            Positioned(
                              left:30,
                              bottom:21,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 17,
                                backgroundImage: AssetImage("assets/image2.png"),
                              ),
                            ),
                        Spacer(),
                        Icon(Icons.calendar_month, color: Colors.grey, size: 15),
                        SizedBox(width: 8),
                        Text(
                          "6 Fab",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  // Kanban eklemek için kullanılan FloatingActionButton'ı oluşturan fonksiyon

  Widget buildKanbanEkleFab(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff744BFC),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        kanbanEkle(context);
      },
    );
  }
// Kanban eklemek için kullanılan fonksiyon
  void kanbanEkle(BuildContext context) async {
    List<dynamic>? sonuc = await pencereAc(context);

    if (sonuc != null && sonuc.length > 1) {
      String kanbanAdi = sonuc[0];
      String kanbanAcikla = sonuc[1];
      int kategori = sonuc[2];

      Kanban yeniKanban = Kanban(kanbanAdi, kanbanAcikla, DateTime.now(), kategori);
      int kanbanIdsi = await yerelVeriTabani.createKanban(yeniKanban);
      print("Kanban Idsi: $kanbanIdsi");
      kanbanlar = [];
      setState(() {});
    }
  }

 // Kanban güncellemek için kullanılan fonksiyon
  void kanbanGuncelle(BuildContext context, int index) async {
    Kanban kanban = kanbanlar[index];

    List<dynamic>? sonuc = await pencereAc(
      context,
      mevcutIsim: kanban.isim,
      mevcutAciklama: kanban.aciklama,
      mevcutKategori: kanban.kategori,
    );

    if (sonuc != null && sonuc.length > 1) {
      String yeniKanbanAdi = sonuc[0];
      String yeniacikla = sonuc[1];
      int yeniKategori = sonuc[2];

      if (kanban.isim != yeniKanbanAdi || kanban.kategori != yeniKategori || kanban.aciklama != yeniacikla) {
        kanban.isim = yeniKanbanAdi;
        kanban.kategori = yeniKategori;
        kanban.aciklama = yeniacikla;

        int guncellenenSatirSayisi = await yerelVeriTabani.updateKanban(kanban);
        if (guncellenenSatirSayisi > 0) {
          setState(() {});
        }
      }
    }
  }

// Kanban silmek için kullanılan fonksiyon
  void kanbanSil(int index) async {
    Kanban kanban = kanbanlar[index];
    int silinenSatirSayisi = await yerelVeriTabani.deleteKanban(kanban);
    if (silinenSatirSayisi > 0) {
      kanbanlar = [];
      setState(() {});
    }
  }

// Seçilen Kanbanları silmek için kullanılan fonksiyon
  void seciliKanbanlariSil() async {
    int silinenSatirSayisi = await yerelVeriTabani.deleteKanbanlar(
      secilenKanbanIdleri,
    );
    if (silinenSatirSayisi > 0) {
      kanbanlar = [];
      setState(() {});
    }
  }

// İlk Kanbanları getirmek için kullanılan fonksiyon
  Future<void> ilkKanbanlariGetir() async {
    if (kanbanlar.isEmpty) {
      kanbanlar = await yerelVeriTabani.readTumKanbanlar(secilenKategori, 0);
      print("İlk Kanbanlar");
      for (Kanban k in kanbanlar) {
        print("${k.isim}, ");
      }
    }
  }
}
