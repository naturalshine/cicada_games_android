import 'package:flutter/material.dart';


import '../utils/app_localizations.dart';
import '../globals.dart' as globals;

import '../main.dart';
import 'info.dart';
import 'geo_screen.dart';
import 'simple_screen.dart';
import '../utils/cicadas_icons.dart';


class CallCicadas extends StatelessWidget {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {

    void _onItemTapped(int index) {
      _selectedIndex = index;
      switch(index){
        case 0: 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppLang()),
          );
          break;
        case 1: 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoScreen()),
          );
          break;
        case 2: 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GeoScreen()),
          );
          break;

      }

    }
    
    return new Scaffold(
      backgroundColor: Color(0xffe9cdb3),

      /*appBar: new AppBar(
        title: new Text(appName,
            style: Theme.of(context).textTheme.headline5,
        ),
        leading: new Container(),
      ),*/
      body: 
        new Stack(
            children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage("assets/images/orb_left.png"), fit: BoxFit.none, alignment: Alignment.topLeft,),
                  ),
                ),
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage("assets/images/metal_orb.png"), fit: BoxFit.none, alignment: Alignment.bottomRight,),
                  ),
                ),
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage("assets/images/wings.png"), fit: BoxFit.cover,),
                  ),
                ),
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage("assets/images/Snakes.png"), fit: BoxFit.cover,),
                  ),
                ),
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage("assets/images/Sprinkles_1.png"), fit: BoxFit.none, alignment: Alignment.topRight,),
                  ),
                ),
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage("assets/images/Sprinkles_2.png"), fit: BoxFit.none, alignment: Alignment.bottomLeft,),
                  ),
                ),
                new Card(
                    margin: const EdgeInsets.fromLTRB(
                      20, 90, 20, 20
                    ),
                    clipBehavior: Clip.antiAlias,
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: new SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 300.0,
                          ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.fromLTRB(
                                  10, 40, 10, 10
                                ),
                                child: Text(
                                  AppLocalizations.of(context).translate('CallCicadasScreen'),
                                  style: Theme.of(context).textTheme.bodyText1,

                                ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                  10, 10, 10, 40
                                ),
                                child: OutlinedButton(
                                  onPressed: () {
                                    globals.selectedScene = AppLocalizations.of(context).translate('callCicadaScene');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SimpleScreen()),
                                    );
                                  },
                                  child: Text(AppLocalizations.of(context).translate('Start'),
                                    style: Theme.of(context).textTheme.headline2,),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Cicadas.globe_africa),
                  label: "EN/DE",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Cicadas.bubble_chart),
                  label: "INFO",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Cicadas.globe_1),
                  label: "PLAY",
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped
            ),
          );
  }
}