import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';

var temporizador = 0;

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final data = [
    ItemData(
      title: "OLA PESSOAL",
      subtitle: " Seja bem vindo Super Bitcoin, clique no circulo ou arraste para o lado!",
      image: const AssetImage("assets/images/welcome.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.amber,
      subtitleColor: Colors.white,
    ),
    ItemData(
      title: "Dados em tempo real",
      subtitle: "Digite os valores e verá o resultado em tempo real com os valores atualizados",
      image: const AssetImage("assets/images/lampada.png"),
      backgroundColor: Colors.white,
      titleColor: const Color.fromRGBO(242, 185, 51, 1),
      subtitleColor: const Color.fromRGBO(02, 10, 56, 1),
    ),
    ItemData(
      title: "Dúvidas",
      subtitle: "Caso tenha alguma dúvida, me chame no whatsapp ou mande um email! \n Clique em começar",
      image: const AssetImage("assets/images/pergunta.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.amber,
      subtitleColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        radius: 25,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          temporizador = index;
          return ItemWidget(data: data[index]);
        },
      ),
    );
  }
}

class ItemData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  ItemData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image(image: data.image),
              ),
              const Spacer(flex: 1),
              Text(
                data.title,
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              const Spacer(flex: 10),
              if (temporizador == 2)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 203, 153, 3),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/homePage');
                  },
                  child: const Text('Começar'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
