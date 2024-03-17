import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LokasyonScreen extends StatefulWidget {
  const LokasyonScreen({super.key});

  @override
  State<LokasyonScreen> createState() => _LokasyonScreenState();
}

class _LokasyonScreenState extends State<LokasyonScreen>
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

  final List<String> resimListesi = [
    'assets/lokasyon_detay_images/mardin/hirmiz_1.jpeg',
    'assets/lokasyon_detay_images/mardin/kale.jpeg',
    'assets/lokasyon_detay_images/mardin/mardinulu_1.jpg',
    'assets/lokasyon_detay_images/mardin/mardinulu_2.jpg',
  ];

  final List<Lokasyon> lokasyonListesi = [
    Lokasyon(
        image: "assets/onboarding_images/kale_1.jpeg",
        ad: "Mardin",
        aciklama:
            "Türkiye'nin güneydoğusunda yer alan Mardin, tarihi dokusuyla ünlü bir şehirdir. Taş evleri, dar sokakları ve manzarasıyla göz kamaştıran bir yapıya sahiptir. Ayrıca, farklı dinlerden ve kültürlerden izler taşıyan birçok dini ve tarihi yapıya ev sahipliği yapar.",
        enlem: 1,
        boylam: 1,
        kategori: "Mounth")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lokasyon Detay Ekranı"),
        actions: [
          IconButton(
            onPressed: () {
              //Favoriye ekleme işlemleri
            },
            icon: const Icon(FontAwesomeIcons.heart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // görsel ve ikonların yer aldığı bölüm
            LokasyonDetayEkraniUstKisim(lokasyonListesi: lokasyonListesi),
            //TabBar ve Şehir isminin bulunduğu alt bölüm
            LokasyonDetayEkraniAltKisim(
                lokasyonListesi: lokasyonListesi,
                tabController: _tabController,
                resimListesi: resimListesi),
          ],
        ),
      ),
    );
  }
}

class LokasyonDetayEkraniUstKisim extends StatelessWidget {
  const LokasyonDetayEkraniUstKisim({
    super.key,
    required this.lokasyonListesi,
  });

  final List<Lokasyon> lokasyonListesi;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      lokasyonListesi[0].image,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      fit: BoxFit.cover,
    );
  }
}

class LokasyonDetayEkraniAltKisim extends StatelessWidget {
  const LokasyonDetayEkraniAltKisim({
    super.key,
    required this.lokasyonListesi,
    required TabController tabController,
    required this.resimListesi,
  }) : _tabController = tabController;

  final List<Lokasyon> lokasyonListesi;
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
                  lokasyonListesi[0].ad,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      size: 15,
                    ),
                    Spacer(),
                    Text(
                      "Lokasyon",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
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
                TabBarAboutEkrani(lokasyonListesi: lokasyonListesi),
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
              .map((resimYolu) => Image.asset(
                    resimYolu,
                    fit: BoxFit.cover,
                  ))
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
    required this.lokasyonListesi,
  });

  final List<Lokasyon> lokasyonListesi;

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10),
          child: Scrollbar(
            child: Text(lokasyonListesi[0].aciklama),
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
