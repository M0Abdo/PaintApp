import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.purple,
    Colors.amber,
    Colors.indigo,
    Colors.brown
  ];
  Color selectColor = Colors.red;
  double Font = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            colors.length,
            (index) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectColor = colors[index];
                  });
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[index],
                      border: selectColor == colors[index]
                          ? Border.all(
                              color: Color.fromARGB(255, 18, 0, 216), width: 2)
                          : null),
                ),
              ),
            ),
          ),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade500, offset: Offset(1, 1)),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: [
            CustomPaint(),
            Positioned(
              top: 20.0,
              child: Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: Slider(
                      activeColor: Color.fromARGB(255, 18, 0, 216),
                      inactiveColor: Colors.grey.shade400,
                      min: 1.0,
                      max: 50.0,
                      value: Font,
                      onChanged: (value) {
                        setState(() {
                          Font = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings_backup_restore_sharp)),
                  ElevatedButton.icon(
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(
                      Colors.white
                    )),
                    
                    onPressed: () {}, label: Text('Clean Board',style: TextStyle(color: Color.fromARGB(255, 18, 0, 216)),),icon: Icon(Icons.cancel_outlined,color: Color.fromARGB(255, 18, 0, 216),),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
