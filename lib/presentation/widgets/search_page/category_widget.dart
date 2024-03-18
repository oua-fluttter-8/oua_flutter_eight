import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 0, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: const Image(
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          image: AssetImage("lib/assets/images/wiew.png"),
                        )),
                  ),
                  const Text(
                    "Dağ",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
