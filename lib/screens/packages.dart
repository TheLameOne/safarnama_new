import 'package:flutter/material.dart';

import '../custom/PlanCard.dart';

class PackagesScreen extends StatefulWidget {
  static const String routeNamed = "PackagesScreen";

  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Packages",
            style: TextStyle(color: Colors.black),
          ),
          actions: const []),
      body: SingleChildScrollView(
          child: Column(
        children: [
          for (var j = 0; j < 10; j++)
            Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: PlanCard(
                  duration: "duration",
                  heading: 'Experience Kerela',
                  description: 'A journey into the nature',
                  price: 20000,
                  discount: 20,
                  rating: 4,
                ))
        ],
      )),
    );
  }
}
