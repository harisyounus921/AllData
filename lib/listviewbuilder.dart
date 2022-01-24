import 'package:flutter/material.dart';

class haris extends StatefulWidget {
  @override
  _harisState createState() => _harisState();
}

class _harisState extends State<haris> {
  var list = [
    "Iphone 12",
    "Note 20 Ultra",
    "Mackbook Air",
    "mackbook Pro",
    "gaming PC",
    "Iphone 11"
  ];
  var pic = [
    "assets/q1.jpg",
    "assets/q2.jpg",
    "assets/q3.jpg",
    "assets/q1.jpg",
    "assets/q2.jpg",
    "assets/q3.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ecom App UI",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 50, backgroundImage: AssetImage(pic[index])),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[index],
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.purple,
                                  ),
                                  Text(
                                    "  (23 review)",
                                    style: TextStyle(
                                      color: Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "20 piece",
                                    style: TextStyle(
                                      color: Colors.black26,
                                    ),
                                  ),
                                  Text(
                                    "   \$",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "90",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(
                                "quantity :1 ",
                                style: TextStyle(
                                  color: Colors.black26,
                                ),
                              ),
                            ]),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
