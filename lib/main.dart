import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Konverter Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();

  String selected = '';
  List riwayat = [];
  double hasil = 0;
  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;
  double fahrenheit = 0;

  test() {
    setState(() {
      inputUser = (etInput.text == '') ? 0 : double.parse(etInput.text);
      kelvin = inputUser + 273;
      reamur = (4 / 5) * inputUser;
      fahrenheit = (9 / 5) * inputUser + 32;
      if (selected == 'Kelvin') {
        hasil = inputUser + 273;
      } else if (selected == 'Reamur') {
        hasil = (4 / 5) * inputUser + 32;
      } else if (selected == 'Fahrenheit') {
        hasil = (9 / 5) * inputUser + 32;
      }
      riwayat.add('$selected : $hasil');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: etInput,
                decoration:
                    const InputDecoration(hintText: "Masukkan Nilai Suhu"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: false,
                    hintText: 'Pilih',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 14,
                    )),
                items: ['Kelvin', 'Reamur', 'Fahrentheit'].map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  selected = value!;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 150,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Kelvin'),
                      ),
                      Container(
                        child: Text('$kelvin'),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 150,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Reamur'),
                      ),
                      Container(
                        child: Text('$reamur'),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 150,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Fahrentheit'),
                      ),
                      Container(
                        child: Text('$fahrenheit'),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: double.infinity,
                color: Colors.transparent,
                height: 60,
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                  'Hasil : \n $hasil',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ))),
            InkWell(
              onTap: () {
                test();
              },
              child: Container(
                  width: double.infinity,
                  color: Colors.blue,
                  height: 60,
                  padding: const EdgeInsets.all(10.0),
                  child: const Center(child: Text('Konversi'))),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Riwayat Konversi',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: riwayat.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${riwayat[index]}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}