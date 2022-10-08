import 'dart:math';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TicketApp extends StatefulWidget {
  @override
  _TicketAppState createState() => _TicketAppState();
}

class _TicketAppState extends State<TicketApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          children: [
            ClipPath(
              clipper: TopClipClipper(),
              child: Container(height: MediaQuery.of(context).size.height/5, color: Colors.white,),
            ),
            Container(
              height: MediaQuery.of(context).size.height/1.764,
              width: MediaQuery.of(context).size.width,
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TicketWidget(
                  width: 350,
                  height: 500,
                  isCornerRounded: true,
                  padding: EdgeInsets.all(20),
                  child: TicketData(),
                ),
              ),
              //Center(child: Text("sellest")),
            ),
            Transform.rotate(angle: pi,
              child: ClipPath(
                clipper: TopClipClipper(),
                child: Container(height: MediaQuery.of(context).size.height/5, color: Colors.white,),
            ),
              ),

          ],
        ),
      ),
    );
  }
}

class TopClipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w=size.width;
    double h=size.height;
    Path path = Path();
    //path.moveTo(0, 100);
    path.lineTo(0,h);
    //path.lineTo(w,h);
    path.quadraticBezierTo(w*.5,h-250, w, h);
    //path.quadraticBezierTo(0,h, 0, 0);
    path.lineTo(w, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>lodClipper)=>true;
}

class LeftClipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    //path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>lodClipper)=>true;
}


class TicketData extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  '    Business Class',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Row(
              children: const [
                Text('LHR', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.flight_takeoff,
                    color: Colors.pink,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8.0),
                  child: Text('ISL', style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text('Flight Ticket',
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ticketDetailsWidget(
                  'Passengers', 'Muhammad Haris', 'Date', '05-10-2022'),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 52.0),
                child: ticketDetailsWidget('Flight', '76836A45', 'Gate', '66B'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                child: ticketDetailsWidget('Class', 'Business', 'Seat', '21B'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/barcode.png'),
                    fit: BoxFit.cover
                )),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
          child: Text('+9230 35202370',
            style: TextStyle(color: Colors.black,),
          ),
        ),
        const SizedBox(height: 10),
        Center(child: const Text('Developer: harisyounus921'))
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc, String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
