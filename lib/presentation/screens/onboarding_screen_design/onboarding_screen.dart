// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
                  onboardingImage: demoData[index].onboardingImage,
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/sign_in");
                      },
                      child: const Text("Atla")),
                ),
              )
            ]),
          ),
          //İleri ve geri butonları ile hangi sayfada olunduğunu gösteren nokta sembollerinin olduğu Widget
          SafeArea(
            child: Row(
              children: [
                OnboardEkraniGeriButonuWidget(
                  pageController: _pageController,
                  pageIndex: _pageIndex,
                ),
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
                OnboardEkraniIleriButonuWidget(
                    pageController: _pageController, pageIndex: _pageIndex),
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
    required this.pageIndex,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: IconButton(
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
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class OnboardEkraniIleriButonuWidget extends StatelessWidget {
  OnboardEkraniIleriButonuWidget({
    super.key,
    required PageController pageController,
    required this.pageIndex,
  }) : _pageController = pageController;

  final PageController _pageController;
  int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: IconButton(
          onPressed: () {
            // Son ekrandaysa navigator ile başka bir ekrana yönlendir
            if (pageIndex == demoData.length - 1) {
              Navigator.pushReplacementNamed(context, "/sign_in");
            } else {
              _pageController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 300),
              );
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey[300]),
            iconColor: const MaterialStatePropertyAll(Colors.black),
          ),
          icon: Icon(
            // Eğer son ekrandaysa, ileri yerine tamam butonu göster
            pageIndex == demoData.length - 1
                ? Icons.check
                : Icons.arrow_forward,
          ),
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
  final String image, onboardingImage;

  Onboard({
    required this.image,
    required this.onboardingImage,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: "assets/onboarding_images/kale_1.jpeg",
    onboardingImage: "assets/svg/onboarding-first.svg",
  ),
  Onboard(
      image: "assets/onboarding_images/aphrodisias.jpeg",
      onboardingImage: "assets/svg/onboarding-second.svg"),
  Onboard(
    image: "assets/onboarding_images/yerebatan.jpeg",
    onboardingImage: "assets/svg/onboarding-third.svg",
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.onboardingImage,
  });

  final String image, onboardingImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
        const Spacer(
          flex: 2,
        ),
        SvgPicture.asset(
          onboardingImage,
          semanticsLabel: 'Acme Logo',
          height: 200,
          width: 200,
        ),
        const Spacer(),
      ],
    );
  }
}
