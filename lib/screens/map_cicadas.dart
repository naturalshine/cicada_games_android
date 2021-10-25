import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cicadas/utils/geo_utils.dart';
import '../utils/app_localizations.dart';

import 'dart:developer' as developer;
import '../globals.dart' as globals;
import '../utils/cicadas_icons.dart';
import '../main.dart';
import 'geo_screen.dart';
import 'info.dart';


// map link: https://stackoverflow.com/questions/47046637/open-google-maps-app-if-available-with-flutter

class MapCicadas extends StatelessWidget {
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
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 120,
                    ),
                    clipBehavior: Clip.antiAlias,
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  child:  
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Text(
                              AppLocalizations.of(context).translate("MapToCicadaText", args: [globals.distance]),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[                          
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 10,
                                  ),
                                  child: OutlinedButton(
                                    child: Text(AppLocalizations.of(context).translate('SeeMap').toUpperCase(),
                                      style: Theme.of(context).textTheme.headline2,),
                                    onPressed: () async {
                                      developer.log("pressed");
                                      String _url = returnMapLink(globals.userLocation);
                                      await launch(_url);
                                    },
                                  ),
                                ),
                              ],
                          ),
                      ],
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

