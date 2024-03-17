import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Items extends StatelessWidget {
  final String title;
  final IconData iconData;
  const Items({
    super.key, required this.title, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4), // Açık gri gölge
          spreadRadius: 2,
          blurRadius: 9,
          offset:
          const Offset(0, 3), // Gölgenin yönü ve uzaklığı
        ),
      ],
    ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: Icon(iconData ,size: 24,color: Colors.grey,),
        trailing: const Icon(FontAwesomeIcons.chevronRight,color: Colors.grey,),
        tileColor: Colors.grey.shade50,
      ),);
  }
}