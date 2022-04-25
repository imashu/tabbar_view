import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class choice {
  final String title;
  final IconData icon;
  const choice({required this.title, required this.icon});
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _controller;
  final List<choice> _items = const <choice>[
    choice(title: 'CAR', icon: Icons.directions_car),
    choice(title: 'BICYCLE', icon: Icons.directions_bike),
    choice(title: 'BOAT', icon: Icons.directions_boat),
    choice(title: 'BUS', icon: Icons.directions_bus),
    choice(title: 'TRAIN', icon: Icons.directions_train),
    choice(title: 'WALK', icon: Icons.directions_walk),
  ];
  @override
  void initState() {
    // TODO: implement initState

    _controller = TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar View'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.white)),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: TabPageSelector(
                  controller: _controller,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: _items.map((choice item) {
            return Container(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Text(item.title),
                  Icon(
                    item.icon,
                    size: 120.0,
                  ),
                ],
              )),
            );
          }).toList(),
        ));
  }
}
