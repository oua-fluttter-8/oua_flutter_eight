import 'package:flutter/material.dart';

class OnboardingScreenDesignPage extends StatefulWidget {
  const OnboardingScreenDesignPage({super.key});

  @override
  State<OnboardingScreenDesignPage> createState() =>
      _OnboardingScreenDesignPageState();
}

class _OnboardingScreenDesignPageState
    extends State<OnboardingScreenDesignPage> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage:
            0); //PageController'ın ilk olarak hangi sayfayı göstereceğini belirler
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // uygulama sona ererken bellekte yer kaplamaması adına PageController kaynakları serbest bırakılıyor
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Görsel, Skip butonu ve yazıların olduğu Widget
          Expanded(
            child: Stack(children: [
              PageView.builder(
                itemCount: demoData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  // yeni sayfanın index değeri
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: demoData[index].image,
                  title: demoData[index].title,
                  description: demoData[index].description,
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                      onPressed: () {
                        //Buraya tıklanınca kayıt ekranına yönlendirilecek
                      },
                      child: const Text("Skip")),
                ),
              )
            ]),
          ),
          //İleri ve geri butonları ile hangi sayfada olunduğunu gösteren nokta sembollerinin olduğu Widget
          SafeArea(
            child: Row(
              children: [
                OnboardEkraniGeriButonuWidget(pageController: _pageController),
                const Spacer(),
                ...List.generate(
                  demoData.length, // oluşturulacak eleman sayısı
                  (index) => Padding(
                    // her bir elemanın indexisini temsil eder
                    padding: const EdgeInsets.only(right: 4.0),
                    child: NoktaGorunumu(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
                const Spacer(),
                OnboardEkraniIleriButonuWidget(pageController: _pageController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardEkraniGeriButonuWidget extends StatelessWidget {
  const OnboardEkraniGeriButonuWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: ElevatedButton(
          onPressed: () {
            _pageController.previousPage(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 300),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey[300]),
            iconColor: const MaterialStatePropertyAll(Colors.black),
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class OnboardEkraniIleriButonuWidget extends StatelessWidget {
  const OnboardEkraniIleriButonuWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: ElevatedButton(
          onPressed: () {
            _pageController.nextPage(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 300),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey[300]),
            iconColor: const MaterialStatePropertyAll(Colors.black),
          ),
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

class NoktaGorunumu extends StatelessWidget {
  const NoktaGorunumu({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // hedeflenen renge ve boyuta 300 milisaniyede ulaşılacağını ifade eder
      height: 6,
      width: isActive ? 15 : 6,
      decoration: BoxDecoration(
        color:
            isActive ? const Color(0xFFFADCA9) : Colors.grey.withOpacity(0.7),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: "assets/onboarding_images/kale_1.jpeg",
    title: "Life is short and the world is wide",
    description:
        "At Friends Tours and travel, we customize reliable and truthworthy educational tours to destinations all over the world",
  ),
  Onboard(
    image: "assets/onboarding_images/aphrodisias.jpeg",
    title: "Life is short and the world is wide",
    description:
        "At Friends Tours and travel, we customize reliable and truthworthy educational tours to destinations all over the world",
  ),
  Onboard(
    image: "assets/onboarding_images/yerebatan.jpeg",
    title: "Life is short and the world is wide",
    description:
        "At Friends Tours and travel, we customize reliable and truthworthy educational tours to destinations all over the world",
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
