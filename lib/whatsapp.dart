import 'package:flutter/material.dart';

class Whatsapp extends StatefulWidget {
  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          whatsapp('assets/bg.png', "ali", "Love Pakistan", "4;00 pm", "2"),
          whatsapp('assets/vision.jpg', "bilal", "Develper", "online", "65"),
          whatsapp('assets/bg.png', "haris", "BUSY", "1:00 am", "24"),
        ],
      ),
    );
  }
}

Widget whatsapp(var pic, var name, var status, var time, var message) {
  return ListTile(
    leading: CircleAvatar(radius: 50, backgroundImage: AssetImage(pic)),
    title: Text(name),
    subtitle: Text(status),
    trailing:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(time),
      CircleAvatar(
        backgroundColor: Colors.red,
        radius: 10,
        child: Text(message),
      )
    ]),
  );
}
