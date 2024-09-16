import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../profile/refer_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeNamed = "ProfileScreen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Pic
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Icon(
                      Icons.person,
                      size: 128,
                      color: Styles.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Harsh Verma",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "vermaharsh463.com",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.5,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PROFILE",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.amber),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.card_travel_rounded,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Trips",
                            style: Styles.profileHeading,
                          ),
                          Text(
                            "Manage and View Trips",
                            style: Styles.profileText,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.redAccent),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.wallet,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wallet",
                            style: Styles.profileHeading,
                          ),
                          Text(
                            "Manage Wallet",
                            style: Styles.profileText,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ReferScreen.routeNamed);
                    },
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blueAccent),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.wallet_giftcard,
                                color: Colors.white,
                              ),
                            )),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Refer & Earn",
                              style: Styles.profileHeading,
                            ),
                            Text(
                              "Refer to your friends and earn",
                              style: Styles.profileText,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.greenAccent),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Settings",
                            style: Styles.profileHeading,
                          ),
                          Text(
                            "Manage preferences",
                            style: Styles.profileText,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurple),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.support_agent_rounded,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Support",
                            style: Styles.profileHeading,
                          ),
                          Text(
                            "Customer Support",
                            style: Styles.profileText,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Text(
                  //   "PAYMENT",
                  //   style: TextStyle(
                  //       color: Colors.black54,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(height: 16),
                  // Row(
                  //   children: [
                  //     Container(
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(25),
                  //             color: Colors.blueAccent),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Icon(
                  //             Icons.wallet,
                  //             color: Colors.white,
                  //           ),
                  //         )),
                  //     SizedBox(width: 8),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "Payment Details",
                  //           style: TextStyle(
                  //               color: Colors.black87,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //         Text(
                  //           "Update your payment preferences",
                  //           style: TextStyle(
                  //               color: Colors.black45,
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.bold),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ),
                  // SizedBox(height: 32),
                  // Text(
                  //   "APPEARANCE",
                  //   style: TextStyle(
                  //       color: Colors.black54,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(height: 16),
                  // Row(
                  //   children: [
                  //     Container(
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(25),
                  //             color: Colors.purple),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Icon(
                  //             Icons.color_lens_outlined,
                  //             color: Colors.white,
                  //           ),
                  //         )),
                  //     SizedBox(width: 8),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "Theme",
                  //           style: TextStyle(
                  //               color: Colors.black87,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //         Text(
                  //           "Personalise your Experience",
                  //           style: TextStyle(
                  //               color: Colors.black45,
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.bold),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ),
                  // SizedBox(height: 32),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
