import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int waterValue = 0;
  int get missingWater => waterValue > 1000 ? 0 : 1000 - waterValue;

  String get message {
    if (waterValue <= 0) {
      return 'Você ainda não bebeu água hoje.\nBeba 1000ml por dia para se manter hidratado!';
    } else if (waterValue >= 1000) {
      return 'Parabéns, você atingiu sua meta!';
    } else {
      return 'Continue bebendo para alcançar a meta.';
    }
  }

  void _addWaterValue(int value) {
    setState(() {
      waterValue += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'CONTADOR DE ÁGUA',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Meta: 1000ml',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      '$waterValue ml',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      'Falta $missingWater ml',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    value: (waterValue.clamp(0, 1000) / 1000).toDouble(),
                    backgroundColor: Colors.white,
                    color: Colors.indigo,
                    strokeWidth: 45,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Text(
              'Adicionar mais água:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton('5 ml', 5),
                SizedBox(width: 10),
                buildButton('10 ml', 10),
                SizedBox(width: 10),
                buildButton('20 ml', 20),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton('50 ml', 50),
                SizedBox(width: 10),
                buildButton('100 ml', 100),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      waterValue = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    fixedSize: Size(100, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    'ZERAR',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String label, int value) {
    return ElevatedButton(
      onPressed: () => _addWaterValue(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.indigo)),
        fixedSize: Size(100, 50),
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.indigo[900],
        ),
      ),
      child: Text(label),
    );
  }
}
