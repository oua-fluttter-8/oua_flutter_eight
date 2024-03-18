import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
              width: 60), // Metin ile simge arasına boşluk bırakmak için
          const Expanded(
            child: Center(
              child: Text("MEKAN",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Colors.grey)),
            ),
          ),

          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
