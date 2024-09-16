import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../custom/PackageCard.dart';
import '../package_overview_screen.dart';
import '../packages.dart';

class FavouriteScreen extends StatefulWidget {
  static const String routeNamed = "FavouriteScreen";

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final fireStore = FirebaseFirestore.instance
      .collection("Packages")
      .where("fav", isEqualTo: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "Favourites",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: fireStore,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Budget Travel',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PackagesScreen.routeNamed);
                                },
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (int i = 0; i < snapshot.data!.size; i++)
                                InkWell(
                                  onTap: () {
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PackageOverviewScreen(
                                              description: snapshot
                                                  .data?.docs[i]["description"]
                                                  .toString(),
                                              duration: snapshot
                                                  .data?.docs[i]["duration"]
                                                  .toString(),
                                              fav: snapshot.data?.docs[i]
                                                  ["fav"],
                                              heading: snapshot.data
                                                  ?.docs[i]["headingOfPackage"]
                                                  .toString(),
                                              location: snapshot
                                                  .data?.docs[i]["location"]
                                                  .toString(),
                                              price: snapshot.data?.docs[i]["price"]
                                                  .toDouble(),
                                              rating: snapshot.data?.docs[i]["rating"].toDouble(),
                                              trip: snapshot.data?.docs[i]["packageName"].toString(),
                                              packageid: snapshot.data?.docs[i]["packageId"].toString(),
                                              packagename: snapshot.data?.docs[i]["packageName"].toString(),
                                              maps: snapshot.data?.docs[i]["maps"].toString(),
                                              image: snapshot.data?.docs[i]["image"].toString(),
                                              gallery: snapshot.data?.docs[i]["gallery"].toString()),
                                        ),
                                      );
                                    }
                                  },
                                  child: PackageCard(
                                      dp: snapshot.data?.docs[i]["image"]
                                          .toString(),
                                      trip: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      duration: snapshot
                                          .data?.docs[i]["duration"]
                                          .toString(),
                                      location: snapshot
                                          .data?.docs[i]["location"]
                                          .toString(),
                                      heading: snapshot
                                          .data?.docs[i]["headingOfPackage"]
                                          .toString(),
                                      description: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      rating: snapshot.data?.docs[i]["rating"]
                                          .toDouble(),
                                      price: snapshot.data?.docs[i]["price"]
                                          .toDouble(),
                                      favourite: snapshot.data?.docs[i]["fav"]),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Group Travel',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onTap: () {},
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (int i = 0; i < snapshot.data!.size; i++)
                                InkWell(
                                  onTap: () {
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PackageOverviewScreen(
                                              description: snapshot
                                                  .data?.docs[i]["description"]
                                                  .toString(),
                                              duration: snapshot
                                                  .data?.docs[i]["duration"]
                                                  .toString(),
                                              fav: snapshot.data?.docs[i]
                                                  ["fav"],
                                              heading: snapshot.data
                                                  ?.docs[i]["headingOfPackage"]
                                                  .toString(),
                                              location: snapshot
                                                  .data?.docs[i]["location"]
                                                  .toString(),
                                              price: snapshot.data?.docs[i]["price"]
                                                  .toDouble(),
                                              rating: snapshot.data?.docs[i]["rating"].toDouble(),
                                              trip: snapshot.data?.docs[i]["packageName"].toString(),
                                              packageid: snapshot.data?.docs[i]["packageId"].toString(),
                                              packagename: snapshot.data?.docs[i]["packageName"].toString(),
                                              maps: snapshot.data?.docs[i]["maps"].toString(),
                                              image: snapshot.data?.docs[i]["image"].toString(),
                                              gallery: snapshot.data?.docs[i]["gallery"].toString()),
                                        ),
                                      );
                                    }
                                  },
                                  child: PackageCard(
                                      dp: snapshot.data?.docs[i]["image"]
                                          .toString(),
                                      trip: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      duration: snapshot
                                          .data?.docs[i]["duration"]
                                          .toString(),
                                      location: snapshot
                                          .data?.docs[i]["location"]
                                          .toString(),
                                      heading: snapshot
                                          .data?.docs[i]["headingOfPackage"]
                                          .toString(),
                                      description: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      rating: snapshot.data?.docs[i]["rating"]
                                          .toDouble(),
                                      price: snapshot.data?.docs[i]["price"]
                                          .toDouble(),
                                      favourite: snapshot.data?.docs[i]["fav"]),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Adventure',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onTap: () {},
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (int i = 0; i < snapshot.data!.size; i++)
                                InkWell(
                                  onTap: () {
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PackageOverviewScreen(
                                              description: snapshot
                                                  .data?.docs[i]["description"]
                                                  .toString(),
                                              duration: snapshot
                                                  .data?.docs[i]["duration"]
                                                  .toString(),
                                              fav: snapshot.data?.docs[i]
                                                  ["fav"],
                                              heading: snapshot.data
                                                  ?.docs[i]["headingOfPackage"]
                                                  .toString(),
                                              location: snapshot
                                                  .data?.docs[i]["location"]
                                                  .toString(),
                                              price: snapshot.data?.docs[i]["price"]
                                                  .toDouble(),
                                              rating: snapshot.data?.docs[i]["rating"].toDouble(),
                                              trip: snapshot.data?.docs[i]["packageName"].toString(),
                                              packageid: snapshot.data?.docs[i]["packageId"].toString(),
                                              packagename: snapshot.data?.docs[i]["packageName"].toString(),
                                              maps: snapshot.data?.docs[i]["maps"].toString(),
                                              image: snapshot.data?.docs[i]["image"].toString(),
                                              gallery: snapshot.data?.docs[i]["gallery"].toString()),
                                        ),
                                      );
                                    }
                                  },
                                  child: PackageCard(
                                      dp: snapshot.data?.docs[i]["image"]
                                          .toString(),
                                      trip: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      duration: snapshot
                                          .data?.docs[i]["duration"]
                                          .toString(),
                                      location: snapshot
                                          .data?.docs[i]["location"]
                                          .toString(),
                                      heading: snapshot
                                          .data?.docs[i]["headingOfPackage"]
                                          .toString(),
                                      description: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      rating: snapshot.data?.docs[i]["rating"]
                                          .toDouble(),
                                      price: snapshot.data?.docs[i]["price"]
                                          .toDouble(),
                                      favourite: snapshot.data?.docs[i]["fav"]),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Solo Travel',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onTap: () {},
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (int i = 0; i < snapshot.data!.size; i++)
                                InkWell(
                                  onTap: () {
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PackageOverviewScreen(
                                              description: snapshot
                                                  .data?.docs[i]["description"]
                                                  .toString(),
                                              duration: snapshot
                                                  .data?.docs[i]["duration"]
                                                  .toString(),
                                              fav: snapshot.data?.docs[i]
                                                  ["fav"],
                                              heading: snapshot.data
                                                  ?.docs[i]["headingOfPackage"]
                                                  .toString(),
                                              location: snapshot
                                                  .data?.docs[i]["location"]
                                                  .toString(),
                                              price: snapshot.data?.docs[i]["price"]
                                                  .toDouble(),
                                              rating: snapshot.data?.docs[i]["rating"].toDouble(),
                                              trip: snapshot.data?.docs[i]["packageName"].toString(),
                                              packageid: snapshot.data?.docs[i]["packageId"].toString(),
                                              packagename: snapshot.data?.docs[i]["packageName"].toString(),
                                              maps: snapshot.data?.docs[i]["maps"].toString(),
                                              image: snapshot.data?.docs[i]["image"].toString(),
                                              gallery: snapshot.data?.docs[i]["gallery"].toString()),
                                        ),
                                      );
                                    }
                                  },
                                  child: PackageCard(
                                      dp: snapshot.data?.docs[i]["image"]
                                          .toString(),
                                      trip: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      duration: snapshot
                                          .data?.docs[i]["duration"]
                                          .toString(),
                                      location: snapshot
                                          .data?.docs[i]["location"]
                                          .toString(),
                                      heading: snapshot
                                          .data?.docs[i]["headingOfPackage"]
                                          .toString(),
                                      description: snapshot
                                          .data?.docs[i]["packageName"]
                                          .toString(),
                                      rating: snapshot.data?.docs[i]["rating"]
                                          .toDouble(),
                                      price: snapshot.data?.docs[i]["price"]
                                          .toDouble(),
                                      favourite: snapshot.data?.docs[i]["fav"]),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
