 
import 'package:flutter/material.dart';
import 'package:kanbanboardapp/src/view/alertdialog_page.dart';
import 'package:kanbanboardapp/src/view/card_form.dart';

class CardDetay extends StatefulWidget {
  const CardDetay({super.key});

  @override
  State<CardDetay> createState() => _CardDetayState();
}

class _CardDetayState extends State<CardDetay> {
  bool isTodoCardVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Card'ın ekleneceği durumda kullanılacak olan FAB (Floating Action Button)
      floatingActionButton: isTodoCardVisible
          ? TodoCard(
              onClose: () {
                setState(() {
                  isTodoCardVisible = false;
                });
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          bottom: 10,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Projeye ait kartları oluşturan metod
                buildProjectCard("Refactoring for Word Ninja", "New project for refactoring our app Word ninja"),
               
                const SizedBox(height: 2),
                const Text(
                  "Flutter Proje",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 15),
                // İlgili kişinin bilgilerini gösteren kısım
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14,
                      backgroundImage: AssetImage("assets/image.png"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Reported by ',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: 'Project Manager',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Görevin başlık ve tarih kısmı
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xff744BFC)),
                      ),
                      onPressed: () {
                        setState(() {
                          pencereAc(context, mevcutAciklama: "", mevcutIsim: "", mevcutKategori: 0);
                        });
                      },
                      child: const Text(
                        "To Do",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                    const Text(
                      "06.08.2023",
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Description",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Görevin açıklama kısmı
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(color: const Color(0xffF2F2F2), borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Flutter projesi için sayfalar oluturuldu. Gerekli eklemeler yapldi.",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Görevi tamamlayan kişinin avatarı
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  backgroundImage: AssetImage("assets/image.png"),
                ),
              ],
            ),
            // Özel avatarın konumu
            const Positioned(
              left: 22,
              bottom: 127,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                backgroundImage: AssetImage("assets/image2.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Projeye ait kartları oluşturan metod
  Widget buildProjectCard(String title, String description) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffDFD5FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/logo.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 30),
      ],
    );
  }
}
