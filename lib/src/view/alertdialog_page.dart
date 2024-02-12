
import 'package:flutter/material.dart';

// Asenkron olarak çalışacak ve List<dynamic> türünde bir değer döndürecek olan pencereAc fonksiyonu
Future<List<dynamic>?> pencereAc(
  BuildContext context, {
  String mevcutIsim = "",
  String mevcutAciklama = "",
  int mevcutKategori = 0,
}) {
  // Text alanları için kontrolcüler
  TextEditingController isimController = TextEditingController(
    text: mevcutIsim,
  );
  TextEditingController aciklamaController = TextEditingController(
    text: mevcutAciklama,
  );

  // showDialog, kullanıcıya bir iletişim kutusu gösterir ve döndürülen değeri bekler
  return showDialog<List<dynamic>>(
    context: context,
    builder: (context) {
      int kategori = mevcutKategori;

      // AlertDialog, basit metin ve/veya düğmeler içeren bir iletişim kutusudur
      return AlertDialog(
        surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Kanban", style: TextStyle(color: Colors.black, fontSize: 13)),
            TextButton(
              child: const Icon(
                Icons.close,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        content: StatefulBuilder(
          // StatefulBuilder, içerdiği widget'ın setState metodunu kullanarak durumunu güncellemesini sağlar
          builder: (BuildContext context, void Function(void Function()) setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: isimController,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      hintText: "title",
                      hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                      fillColor: Colors.grey[200], // Arkaplan rengi
                      contentPadding: const EdgeInsets.all(10), // İç içe boşluk
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: aciklamaController,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      hintText: "Description",
                      helperMaxLines: 4,
                      hintMaxLines: 4,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 45), // İç içe boşluk

                      hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                      fillColor: Colors.grey[200], // Arkaplan rengi
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10), // Köşe yuvarlatma
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      hintText: "Status",
                      hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                      fillColor: Colors.grey[200], // Arkaplan rengi
                      contentPadding: const EdgeInsets.all(10), // İç içe boşluk
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10), // Köşe yuvarlatma
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      hintText: "Assignee",
                      hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                      fillColor: Colors.grey[200], // Arkaplan rengi
                      contentPadding: const EdgeInsets.all(10), // İç içe boşluk
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10), // Köşe yuvarlatma
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(125, 40),
                        backgroundColor: const Color(0xff744BFC)),
                    // Genişlik ve yükseklik

                    onPressed: () {
                      // showDialog'dan dönen değerleri kullanarak Navigator.pop ile iletişim kutusunu kapat
                      Navigator.pop(context, [isimController.text.trim(), aciklamaController.text.trim(), kategori]);
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
