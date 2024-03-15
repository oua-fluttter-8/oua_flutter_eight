import 'package:flutter/material.dart';

class OnboardingScreenDesignPage extends StatefulWidget {
  const OnboardingScreenDesignPage({super.key});

  @override
  State<OnboardingScreenDesignPage> createState() =>
      _OnboardingScreenDesignPageState();
}

class _OnboardingScreenDesignPageState
    extends State<OnboardingScreenDesignPage> {
  /*
  PageController, birden fazla sayfayı kaydırarak gösteren bir widget olan
  PageView'ı kontrol etmek için kullanılır. Aşağıdaki görevleri yerine getirir:
    Sayfalar arasında geçiş yapmayı sağlar.
    Mevcut sayfanın konumunu takip eder.
    Sayfa kaydırma animasyonlarını kontrol eder.
   */
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
          Expanded(
            child: PageView.builder(
              itemCount: demo_data.length,
              controller: _pageController,
              onPageChanged: (index) {
                // yeni sayfanın index değeri
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) => OnboardContent(
                image: demo_data[index].image,
                title: demo_data[index].title,
                description: demo_data[index].description,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        /*
                        "curve: Curves.ease:"
                        Bu parametre, sayfa geçiş animasyonunun hız
                        eğrisini belirler. Curves.ease, yavaş başlayıp hızlanarak devam
                        eden bir animasyon sağlar. Başka seçenekler de vardır:
                          Curves.linear: Animasyon sabit bir hızla ilerler.
                          Curves.easeIn: Animasyon yavaş başlayıp hızlanır.
                          Curves.easeOut: Animasyon hızlı başlayıp yavaşlar.
                          Curves.easeInOut: Animasyon yavaş başlayıp, hızlanıp, tekrar yavaşlar.

                          "duration: const Duration(milliseconds: 300):"
                           Bu komut, sayfa kaydırma animasyonunun süresini belirler.
                           Bu durumda, animasyon 300 milisaniye sürer.

                          Farklı Süreler:
                          Duration(seconds: 1): Animasyon 1 saniye sürer.
                          Duration(milliseconds: 500): Animasyon 500 milisaniye sürer.
                         */
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red[50]),
                      iconColor: const MaterialStatePropertyAll(Colors.black),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
              const Spacer(),
              /*
              Sayfa geçişlerini daha iyi görselleştirebilmek adına sayfaların altına
              noktalardan oluşan bir satır oluşturur. Mevcut sayfanın noktası diğerlerindne
              daha farklı bir görünüme sahiptir.
               */
              ...List.generate(
                demo_data.length, // oluşturulacak eleman sayısı
                    (index) => Padding( // her bir elemanın indexisini temsil eder
                  padding: const EdgeInsets.only(right: 4.0),
                  child: DotIndicator(
                    isActive: index == _pageIndex,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
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
                      backgroundColor: MaterialStatePropertyAll(Colors.red[50]),
                      iconColor: const MaterialStatePropertyAll(Colors.black),
                    ),
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    /*
    AnimatedContainer, Flutter'da belirli özelliklerini animasyonlu bir şekilde
    değiştirebilen bir container widget'ıdır. Bu sayede, kullanıcı arayüzüne daha
    şık ve etkileşimli bir görünüm kazandırmak mümkündür.

    Sadece nokta olarak gösterileceği için child property'si bu Widget ile kullanılmamıştır.
     */
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // hedeflenen renge ve boyuta 300 milisaniyede ulaşılacağını ifade eder
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey : Colors.grey.withOpacity(0.4),
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

final List<Onboard> demo_data = [
  Onboard(
    image: "images/image1.png",
    title: "Buraya başlık girilecek",
    description:
    "buraya kullanıcıyı bilgilendirmek amacıyla biraz daha detaylı açıklamalar girilebilir",
  ),
  Onboard(
    image: "images/image2.png",
    title: "Buraya başlık girilecek",
    description:
    "buraya kullanıcıyı bilgilendirmek amacıyla biraz daha detaylı açıklamalar girilebilir",
  ),
  Onboard(
    image: "images/image3.png",
    title: "Buraya başlık girilecek",
    description:
    "buraya kullanıcıyı bilgilendirmek amacıyla biraz daha detaylı açıklamalar girilebilir",
  ),
  Onboard(
    image: "images/image4.png",
    title: "Buraya başlık girilecek",
    description:
    "buraya kullanıcıyı bilgilendirmek amacıyla biraz daha detaylı açıklamalar girilebilir",
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
        const Spacer(),
        Image.asset(
          image,
          height: 300,
        ),
        const Spacer(),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
