import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu/Applications/TicketApp/TicketApp.dart';

class TicketInputData extends StatefulWidget {
  @override
  _TicketInputDataState createState() => _TicketInputDataState();
}

class _TicketInputDataState extends State<TicketInputData> {

  TextEditingController NameController=TextEditingController();
  DateTime date=DateTime.now();
  TimeOfDay time=TimeOfDay(hour: 8, minute: 30);

  String Sourcedropdownvalue = 'LH';
  String Destinationdropdownvalue = 'KAR';
  var items = [
    'LH',
    'KAR',
    'ISL',
    'MUL',
  ];
  String Classvalue = 'Business';
  var classType = [
    'Business',
    'Standard',
    'Economy',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(child: Text("Welcome To Ticket Generator")),
              SizedBox(height: 30,),

              Text("Enter Your Name"),
              SizedBox(height: 10,),
              Container(
                width: 200,
                child: TextFormField(
                  controller: NameController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Your Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),

              Text("Select Type "),
              SizedBox(height: 10,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      value: Classvalue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: classType.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          Classvalue = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),

              Text("Select Source "),
              SizedBox(height: 10,),
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: Sourcedropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        Sourcedropdownvalue = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),

              SizedBox(height: 30,),

              Text("Select Destination "),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      value: Destinationdropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          Destinationdropdownvalue = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              SizedBox(height: 30,),

              Text("Select your date of Flight"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child:  Text('${date.day}/${date.month}/${date.year}',
                      style: TextStyle(fontSize: 22),),
                    onPressed: ()async{
                      DateTime newDate=await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2050),
                      );
                      if(newDate==null)return;
                      setState(() {
                        date=newDate;
                      });
                    },
                  ),
                  SizedBox(width: 30,),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 48),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          date = DateTime.now();
                        });
                      },
                      child: Text(
                        "CURRENT DATE",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text("Select your Time of Flight"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text(time.format(context).toString()),
                    onPressed: ()async {
                      TimeOfDay newtime =await showTimePicker(context: context, initialTime: await TimeOfDay.now());
                      if(newtime==null)return;
                      setState(() {
                        time=newtime;
                      });
                      },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 48),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          time=TimeOfDay.now();
                        });
                        },
                      child: Text(
                        "CURRENT TIME", style: TextStyle(color: Colors.red),),
        ),
      ),
                ],
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    if(Sourcedropdownvalue.toString()==Destinationdropdownvalue.toString()){
                      Fluttertoast.showToast(msg: "Source and destination must not be same",timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                      );
                    }else if(NameController.text==""){
                      Fluttertoast.showToast(msg: "Pasinger name must be entered",timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }else{
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TicketApp(
                            name:NameController.text.trim(),
                            sourcevalue: Sourcedropdownvalue.toString(),
                            destinationvalue: Destinationdropdownvalue.toString(),
                            date: date,
                            time: time,
                            Classvalue: Classvalue,)));
                    }

                  },
                  child: Text("Generate Ticket")),
            ],
          ),
        ),
      ),
    );
  }
}
