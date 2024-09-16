import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  String? heading;
  String? description;
  String? duration;
  double? rating;
  double? price;
  double? discount;
  String? image;

  PlanCard(
      {super.key, this.duration,
      this.heading,
      this.description,
      this.rating,
      this.price,
      this.discount,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Image
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image!), fit: BoxFit.fill),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 8),
            // Data
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    duration!,
                    style: const TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    heading!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description!,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            (i < rating!)
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.star_outline,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.share_rounded, size: 22)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // Rate
        SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        IconData(0xf05db, fontFamily: 'MaterialIcons'),
                        size: 16,
                      ),
                      Text(price!.toInt().toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Text('per person',
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
              if (discount! > 0)
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2, bottom: 2, left: 8, right: 8),
                    child: Text('${discount?.truncate()}% OFF',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              const SizedBox(height: 4),
            ],
          ),
        )
      ]),
    );
  }
}
