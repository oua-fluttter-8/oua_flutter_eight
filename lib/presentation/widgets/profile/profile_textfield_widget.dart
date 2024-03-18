import 'package:flutter/material.dart';

class ProfileTextfieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const ProfileTextfieldWidget({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8.0), // Başlık ile metin alanı arasında boşluk
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Açık gri gölge
                spreadRadius: 2,
                blurRadius: 9,
                offset: const Offset(0, 3), // Gölgenin yönü ve uzaklığı
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
