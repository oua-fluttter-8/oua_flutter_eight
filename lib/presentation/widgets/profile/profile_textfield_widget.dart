import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProfileTextField_widgets extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProfileTextField_widgets({
    super.key, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  const EdgeInsets.only(left: 4.0),
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
                color:
                Colors.grey.withOpacity(0.5), // Açık gri gölge
                spreadRadius: 2,
                blurRadius: 9,
                offset:
                const Offset(0, 3), // Gölgenin yönü ve uzaklığı
              ),
            ],
          ),
          child: Padding(
            padding:  const EdgeInsets.only(left: 20.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  FontAwesomeIcons.check,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: subtitle,

              ),
            ),
          ),
        ),
      ],
    );
  }
}