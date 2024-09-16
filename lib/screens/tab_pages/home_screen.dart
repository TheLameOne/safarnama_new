import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safarnama/screens/search_screen.dart';
import '../../custom/CustomSearchButton.dart';
import '../../custom/CustomSearchField.dart';
import '../../custom/PackageCard.dart';
import '../../custom/PlanCard.dart';
import '../../utils/global.dart';

import '../package_overview_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNamed = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchField;
  final ScrollController _scrollViewController = ScrollController();
  final fireStore =
      FirebaseFirestore.instance.collection("Packages").snapshots();
  // final fav = FirebaseFirestore.instance
  //     .collection("Users")
  //     .where("phonenumber", isEqualTo: userId)
  //     .snapshots();

  bool visible = false;
  bool search = false;

  @override
  void initState() {
    super.initState();
    // _scrollViewController.addListener(() {
    //   setState(() {
    //     // visible = _scrollViewController.offset > 300 ? true : false;
    //     // search = _scrollViewController.offset > 570 ? true : false;
    //     // print(_scrollViewController.offset);
    //     // print(visible);
    //   });
    // });
  }

  List<String> categories = [
    "Relaxing",
    "Trekking",
    "Camping",
    "Honeymoon",
  ];

  List<Color> colors = [
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.amber,
    Colors.pinkAccent
  ];

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(DatabaseService());
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // drawer: Drawer(),
        body: CustomScrollView(controller: _scrollViewController, slivers: [
      SliverAppBar(
        backgroundColor: Colors.white,
        // centerTitle: ,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/6465964/pexels-photo-6465964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,
              ),
              // borderRadius:
              //     BorderRadius.only(bottomRight: Radius.circular(50)
              //     )
            ),
            height: size.height * 0.4,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Title
                    Text(
                      heroHeading,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Hero Search Bar
                    Row(
                      children: [
                        // Search bar
                        CustomSearchField(
                            width: size.width * 0.5,
                            labelText: '',
                            hintText: 'Where you want to go?',
                            initialValue: '',
                            onChanged: (val) {
                              setState(() {
                                searchField = val;
                              });
                            }),
                        // Search Button
                        CustomSearchButton(
                          labelText: 'Search',
                          onTap: () {
                            if (searchField != Null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SearchPage(text: searchField),
                                  ));
                            }
                          },
                          containerColor: Colors.yellow,
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
        pinned: true,
        stretch: true,
        // snap: true,
        // floating: true,
        expandedHeight: size.height * 0.4,
        elevation: 0,
        actions: [
          const SizedBox(
            width: 2,
          ),
          const SizedBox(width: 12),
          InkWell(
              onTap: () {},
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.share)),
          const SizedBox(width: 24),
          InkWell(
            onTap: () {},
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.notifications),
          ),
          const SizedBox(width: 12)
        ],
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            // Packages
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Exciting Packages',
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
                  const SizedBox(height: 8),
                  StreamBuilder<QuerySnapshot>(
                      stream: fireStore,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
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
                                              builder: (context) =>
                                                  PackageOverviewScreen(
                                                    description: snapshot.data
                                                        ?.docs[i]["description"]
                                                        .toString(),
                                                    duration: snapshot.data
                                                        ?.docs[i]["duration"]
                                                        .toString(),
                                                    fav: snapshot.data?.docs[i]
                                                        ["fav"],
                                                    heading: snapshot
                                                        .data
                                                        ?.docs[i]
                                                            ["headingOfPackage"]
                                                        .toString(),
                                                    location: snapshot.data
                                                        ?.docs[i]["location"]
                                                        .toString(),
                                                    price: snapshot
                                                        .data?.docs[i]["price"]
                                                        .toDouble(),
                                                    rating: snapshot
                                                        .data?.docs[i]["rating"]
                                                        .toDouble(),
                                                    trip: snapshot.data
                                                        ?.docs[i]["packageName"]
                                                        .toString(),
                                                    packageid: snapshot.data
                                                        ?.docs[i]["packageId"]
                                                        .toString(),
                                                    packagename: snapshot.data
                                                        ?.docs[i]["packageName"]
                                                        .toString(),
                                                    maps: snapshot
                                                        .data?.docs[i]["maps"]
                                                        .toString(),
                                                    image: snapshot
                                                        .data?.docs[i]["image"]
                                                        .toString(),
                                                    gallery: snapshot.data
                                                        ?.docs[i]["gallery"]
                                                        .toString(),
                                                  )),
                                        );
                                      }
                                    },
                                    child: PackageCard(
                                        // trip: packages[i].packagename,
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
                                        favourite: snapshot.data?.docs[i]
                                            ["fav"]),
                                  )
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          print("error 2");
                          return Center(child: Text(snapshot.error.toString()));
                        } else {
                          print("Error 3");
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Travel Categories',
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
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
          child: StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: size.width - 32,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        for (var i = 0; i < snapshot.data!.size; i++)
                          Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: InkWell(
                                onTap: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PackageOverviewScreen(
                                          description: snapshot
                                              .data?.docs[i]["description"]
                                              .toString(),
                                          duration: snapshot
                                              .data?.docs[i]["duration"]
                                              .toString(),
                                          fav: snapshot.data?.docs[i]["fav"],
                                          heading: snapshot
                                              .data?.docs[i]["headingOfPackage"]
                                              .toString(),
                                          location: snapshot
                                              .data?.docs[i]["location"]
                                              .toString(),
                                          price: snapshot.data?.docs[i]["price"]
                                              .toDouble(),
                                          rating: snapshot
                                              .data?.docs[i]["rating"]
                                              .toDouble(),
                                          trip: snapshot
                                              .data?.docs[i]["packageName"]
                                              .toString(),
                                          packageid: snapshot
                                              .data?.docs[i]["packageId"]
                                              .toString(),
                                          packagename: snapshot
                                              .data?.docs[i]["packageName"]
                                              .toString(),
                                          gallery: snapshot
                                              .data?.docs[i]["gallery"]
                                              .toString(),
                                          image: snapshot.data?.docs[i]["image"]
                                              .toString(),
                                          maps: snapshot.data?.docs[i]["maps"]
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: PlanCard(
                                  duration: snapshot.data?.docs[i]["duration"]
                                      .toString(),
                                  heading: snapshot.data?.docs[i]["packageName"]
                                      .toString(),
                                  description: snapshot
                                      .data?.docs[i]["headingOfPackage"]
                                      .toString(),
                                  price: snapshot.data?.docs[i]["price"]
                                      .toDouble(),
                                  discount: snapshot.data?.docs[i]["discount"]
                                      .toDouble(),
                                  rating: snapshot.data?.docs[i]["rating"]
                                      .toDouble(),
                                  image: snapshot.data?.docs[i]["image"]
                                      .toString(),
                                ),
                              ))
                      ]),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print("error 2");
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  print("Error 3");
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
      // SliverPersistentHeader(
      //   pinned: true,
      //   delegate: PersistentHeader(
      //     add: 50.0,
      //     // widget: Text("Harsh")
      //     widget: Container(
      //         color: Colors.white,
      //         height: 64,
      //         child: ListView(
      //             physics: BouncingScrollPhysics(),
      //             scrollDirection: Axis.horizontal,
      //             children: [
      //               for (int i = 0; i < categories.length; i++)
      //                 CategoriesCard(
      //                     categories: categories[i], color: colors[i])
      //             ])),
      //   ),
      // ),
    ]));
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  double add = 0;

  // (visible == true)? add = 32: add = 0;

  PersistentHeader({required this.widget, required this.add});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: widget,
    );
  }

  @override
  double get maxExtent => 64.0 + add;

  @override
  double get minExtent => 64.0 + add;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
