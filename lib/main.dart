import 'package:flutter/material.dart';

const int num = 2;
const String student = "Сафронов Дмитрий Иванович";

//Массив с изображениями;
const List<String> battery_assets = [
  "assets/battery/battery-0.png",
  "assets/battery/battery-25.png",
  "assets/battery/battery-50.png",
  "assets/battery/battery-75.png",
  "assets/battery/battery-100.png",
  "assets/battery/battery-minus.png",
  "assets/battery/battery-plus.png"
];

//Класс для хранения обзорного изображения;
class BoxImage extends StatelessWidget
{
  final String image;
  final double size;

  //Конструктор;
  const BoxImage(
    {
      super.key,
      required this.image,
      this.size = 100
    }
  );

  //Импортированный метод со входными значениями;
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(image, width: size, height: size, fit: BoxFit.contain));
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  //Функция для создания заголовка;
  Widget buildAppBar(String title, {bool bold = false})
  {
    return SliverAppBar(
      title: Text(title, style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
    );
  }

  //Функция для создания строки с изображениями;
  Widget buildTapeImage(List<String> images)
  {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: images.map((path) => BoxImage(image: path)).toList()
      )
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 65, 65, 65), //Заливка всего окна;
        body: CustomScrollView( 
          slivers: [
            buildAppBar("Лабораторная работа $num", bold: true),
            buildAppBar("Выполнил: $student", bold: false),
            
            SliverToBoxAdapter(
              child: Center( //По центру;
                child: Column( //Столбец;
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    buildTapeImage(battery_assets),
                    buildTapeImage(battery_assets),
                    buildTapeImage(battery_assets)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}