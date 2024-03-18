import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oua_flutter_eight/core/components/appbar/custom_app_bar.dart';
import 'package:oua_flutter_eight/models/location_model.dart';

class LocationDetailsPage extends StatefulWidget {
  final LocationModel location;
  const LocationDetailsPage({super.key, required this.location});

  @override
  State<LocationDetailsPage> createState() => _LocationDetailsPageState();
}

class _LocationDetailsPageState extends State<LocationDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // görsel ve ikonların yer aldığı bölüm
            LokasyonDetayEkraniUstKisim(location: widget.location),
            //TabBar ve Şehir isminin bulunduğu alt bölüm
            LokasyonDetayEkraniAltKisim(
                location: widget.location,
                tabController: _tabController,
                resimListesi: widget.location.locationGallery),
          ],
        ),
      ),
    );
  }
}

class LokasyonDetayEkraniUstKisim extends StatelessWidget {
  const LokasyonDetayEkraniUstKisim({
    super.key,
    required this.location,
  });

  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      location.locationPhotoUrl,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      fit: BoxFit.cover,
    );
  }
}

class LokasyonDetayEkraniAltKisim extends StatelessWidget {
  const LokasyonDetayEkraniAltKisim({
    super.key,
    required TabController tabController,
    required this.resimListesi,
    required this.location,
  }) : _tabController = tabController;

  final LocationModel location;
  final TabController _tabController;
  final List<String> resimListesi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.locationName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      size: 15,
                    ),
                    const Spacer(),
                    Text(
                      location.locationCity,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            onTap: (secilenIndex) {},
            tabs: const [
              Tab(child: Text("About")),
              Tab(child: Text("Review")),
              Tab(child: Text("Photo")),
              Tab(child: Text("Video")),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TabBarAboutEkrani(location: location),
                const TabBarReviewEkrani(),
                TabBarPhotoEkrani(resimListesi: resimListesi),
                const TabBarVideoEkrani(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarVideoEkrani extends StatelessWidget {
  const TabBarVideoEkrani({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Video',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}

class TabBarPhotoEkrani extends StatelessWidget {
  const TabBarPhotoEkrani({
    super.key,
    required this.resimListesi,
  });

  final List<String> resimListesi;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.3,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: resimListesi
              .map(
                (resimYolu) => CachedNetworkImage(
                  imageUrl: resimYolu,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class TabBarReviewEkrani extends StatelessWidget {
  const TabBarReviewEkrani({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Review',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}

class TabBarAboutEkrani extends StatelessWidget {
  const TabBarAboutEkrani({
    super.key,
    required this.location,
  });

  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    final double ekranYuksekligi = MediaQuery.of(context).size.height;
    final double ekrangenisligi = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
          child: Text(
            "Tanıtım",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
            //textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                left: ekrangenisligi / 20,
                right: ekrangenisligi / 20,
                top: 10,
                bottom: ekranYuksekligi / 15),
            child: SingleChildScrollView(
              child: Text(location.locationDescription),
            ),
          ),
        )
      ],
    );
  }
}

class Lokasyon {
  final String image, ad, aciklama, kategori;
  final double enlem, boylam;

  Lokasyon({
    required this.image,
    required this.ad,
    required this.aciklama,
    required this.enlem,
    required this.boylam,
    required this.kategori,
  });
}
