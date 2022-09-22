import 'package:flutter/cupertino.dart';
import 'package:menu/Pages/Menu/Body&Slider.dart';
import 'package:menu/Pages/Menu/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/ScrollOfSetProvider.dart';

class menus extends StatefulWidget {
  @override
  _menusState createState() => _menusState();
}

class _menusState extends State<menus> {


  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController=ScrollController();
    _scrollController?.addListener(() {
      Provider.of<ScrollOfSetProvider>(context,listen: false).setOffset(_scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollOfSetProvider>(
        builder: (context,ScrollOfSetProvider,child){
          return Scaffold(
            //extendBodyBehindAppBar: true,
            drawer: CustomDrawer(),
            appBar: AppBar(
                centerTitle: true,
                title: Text("All In One"),

                backgroundColor: Colors.transparent//indigo.withOpacity((ScrollOfSetProvider.scrollofset/350).clamp(0,1).toDouble()),
              /*  automaticallyImplyLeading: false,
            actions: [
              IconButton(icon: Icon(Icons.account_circle),
                  color: Colors.blue,
                  iconSize: 30, onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen(user:widget.user)));}),

        PopupMenuButton(itemBuilder: (context)=>[
                PopupMenuItem(child: Text("Light Theme"), onTap: (){themechange.setTheme(ThemeMode.light);},),
                PopupMenuItem(child: Text("Dark Theme"), onTap: (){themechange.setTheme(ThemeMode.dark);},),
              ],),
             ],*/
            ),
            body:CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: CustomSlider(),),
                SliverToBoxAdapter(
                  child:SizedBox(height: 10,),  //CustomSeeMore(),
                ),
                SliverToBoxAdapter(
                  child: FittedBox(child: Padding(
                    padding: const EdgeInsets.only(left: 3,right: 3),
                    child: Text("Swap Left to Open the Applications",style: TextStyle(
                        color: Colors.white,backgroundColor: Colors.indigo,fontStyle: FontStyle.italic),),
                  ),
                  ),),
                SliverToBoxAdapter(
                    child: BodyPart()),
              ],
            ),
          );
        }
    );
  }
}


class CustomSeeMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 25,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height:  MediaQuery.of(context).size.height / 100,
                width:  MediaQuery.of(context).size.height / 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
