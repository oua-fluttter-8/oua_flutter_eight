import 'package:flutter/material.dart';

class PlaceCardsWidget extends StatelessWidget {
  const PlaceCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              child: Container(
                  width: 347,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: 327,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: const Image(
                                  width: 327,
                                  height: 130,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/png/location-dummy.png"),
                                )),
                          ),
                          const SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ranu Kumbolo",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "4.8",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.end,
                                        ),
                                      ])
                                    ]),
                                Row(children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    "Lumanjang, Jawa timur",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ]),
                              ],
                            ),
                          )
                        ],
                      ))),
            ),
        ]),
      ),
    );
  }
}
