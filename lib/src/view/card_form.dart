
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final Function onClose;

  const TodoCard({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4), // Gölge rengi
                spreadRadius: 5, // Gölge yayılımı
                blurRadius: 7, // Gölge bulanıklığı
                offset: const Offset(0, 3), // Gölgenin konumu (x, y)
              ),
            ],
            color: Colors.white,
          ),
          width: 300,
          height: 465,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      onClose();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "To Do",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
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
                  hintText: "title",
                  hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                  fillColor: Colors.grey[200], 
                  contentPadding: const EdgeInsets.all(10), 
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x0ff744bf)),
                  ),
                  filled: true,
                  hintText: "title",
                  hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                  fillColor: Colors.grey[200], 
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 45), 
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  hintText: "title",
                  hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                  fillColor: Colors.grey[200], 
                  contentPadding: const EdgeInsets.all(10), 
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  hintText: "title",
                  hintStyle: const TextStyle(color: Color(0xffB1B1B1), fontSize: 11),
                  fillColor: Colors.grey[200], 
                  contentPadding: const EdgeInsets.all(10), 
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
