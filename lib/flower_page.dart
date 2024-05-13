import 'dart:math';

import 'package:flower_app/petales_container.dart';
import 'package:flutter/material.dart';

class FlowerPage extends StatefulWidget {
  @override
  _FlowerPageState createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
  List<Color> petalColors1 = [];
  List<bool> petals1 = [];
  bool isLoveVisible = false;
  late int numPatels;

  void regenerateColorsAndPetals() {
    setState(() {
      generateRandomPetalColors();
      isLoveVisible = Random().nextBool();
    });
  }

  @override
  void initState() {
    super.initState();
    generateRandomPetalColors();
  }

  Color generateRandomColor() {
    Random random = Random();
    int red = random.nextInt(256); // قيمة عشوائية بين 0 و 255
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue);
  }

  void generateRandomPetalColors() {
    numPatels = Random().nextInt(15 - 10) + 10;
    print("numPatels ..... $numPatels");

    petals1 = List.filled(numPatels, true);

    petalColors1 = List<Color>.generate(
      petals1.length,
      (_) {
        Color color;
        do {
          color = generateRandomColor();
        } while (petalColors1.contains(color));
        return color;
      },
    );
  }

  void removePetal(int index) {
    setState(() {
      petals1[index] = false;
      isLoveVisible = !isLoveVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // ... بقية الكود هنا
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue ,
        title: Text('Love cheack App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 26,
            ),
            Text(
              'Love cheack',
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: height / 16,
            ),
            Text(
              'Tap on flower to remove it ',
              style: TextStyle(fontSize: 22),
            ),
            PetalsContainer(
              height: height,
              width: width,
              petals1: petals1,
              petalColors1: petalColors1,
              removePetal: removePetal,
            ),
            Container(
              height: height / 14,
              child: petals1.contains(false)
                  ? Text(
                      isLoveVisible ? 'Love' : 'Does not Love',
                      style: TextStyle(fontSize: 24),
                    )
                  : SizedBox(),
            ),
            // !petals1.contains(true)
            // ?
            ElevatedButton(
              onPressed: regenerateColorsAndPetals,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'ReStart',
                style: TextStyle(color: Colors.white),
              ),
            )
            //: SizedBox(),
          ],
        ),
      ),
    );
  }
} // Icon(
// Icons.circle,
// size: 100,
// ),
