import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceCardsWidget extends StatelessWidget {
  final String locationName;
  final String locationImage;
  final String locationCity;
  final void Function()? onPressed;
  final void Function()? deleteOnPressed;
  const PlaceCardsWidget({
    super.key,
    required this.locationName,
    required this.locationImage,
    required this.locationCity,
    required this.onPressed,
    this.deleteOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(children: [
        Container(
            width: 347,
            height: 250,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        child: CachedNetworkImage(
                          width: 327,
                          height: 130,
                          imageUrl: locationImage,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  locationName,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                Row(children: [
                                  deleteOnPressed == null
                                      ? IconButton(
                                          onPressed: onPressed,
                                          icon: const Icon(
                                            FontAwesomeIcons.plus,
                                            size: 30,
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: deleteOnPressed,
                                          icon: const Icon(
                                            FontAwesomeIcons.trash,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                ])
                              ]),
                          Row(children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.red,
                            ),
                            Text(
                              locationCity,
                              style: const TextStyle(
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
      ]),
    );
  }
}
