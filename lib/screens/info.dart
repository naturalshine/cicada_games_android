import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../main.dart';
import 'geo_screen.dart';

import '../utils/cicadas_icons.dart';
import '../utils/app_localizations.dart';


class InfoScreen extends StatelessWidget {
  int _selectedIndex = 1;

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
    return new DefaultTabController(

          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xffe9cdb3),

            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0), // here the desired height
                  child: AppBar(
                      /*title: new Text(appName,
                          style: Theme.of(context).textTheme.headline5,
                      ),*/
                      leading: new Container(),
                      bottom: TabBar(
                        labelStyle: Theme.of(context).textTheme.subtitle1,  //For Selected tab
                        unselectedLabelStyle: Theme.of(context).textTheme.subtitle2, //For Un-selected Tabs
                        tabs: [
                          Tab(text: "CREDITS"),
                          Tab(text: "TECH"),
                        ],
                      ),
                    ),
            ),
            body: TabBarView(
              children: [
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
                                    horizontal: 10,
                                    vertical: 40,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                child:  
                                  new SingleChildScrollView(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: 300.0,
                                      ),
                                      child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 20,
                                            ),
                                            child: Image.asset('assets/images/cicadagames_clairetolan.png'),
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 10,
                                            ),
                                              child: Text(
                                                AppLocalizations.of(context).translate('InfoText2'),
                                                style: Theme.of(context).textTheme.bodyText1,
                                              ),
                                          ),
                                         Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 20,
                                            ),
                                            child: Image.asset('assets/images/czirpczirp.png'),
                                        ),
                                      ],
                                    ),
                                    ),
                                  ),
                                ),
                              ],
                          ),
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
                                    horizontal: 10,
                                    vertical: 40,
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
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 20,
                                                ),
                                                child: Text(
                                                  AppLocalizations.of(context).translate('InfoText3'),
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
                                                              child: Text(AppLocalizations.of(context).translate('mailAddress').toUpperCase(),
                                                              style: Theme.of(context).textTheme.headline2,),
                                                              onPressed: () async{
                                                                String _url = "mailto:requests@cicadidae.systems";
                                                                await launch(_url);
                                                              }, 
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 10,
                                                        ),
                                                        child: Text(
                                                          AppLocalizations.of(context).translate('InfoText4'),
                                                          style: Theme.of(context).textTheme.bodyText1,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                        Container(
                                                            padding: EdgeInsets.symmetric(
                                                              horizontal: 0,
                                                              vertical: 20,
                                                            ),
                                                            child: OutlinedButton(
                                                                style: OutlinedButton.styleFrom(
                                                                    padding: EdgeInsets.symmetric(
                                                                      horizontal: 20,
                                                                      vertical: 20,
                                                                    ),
                                                                ),
                                                                onPressed: () async{
                                                                  String _url = "http://www.czirpczirp.cc/?page_id=768";
                                                                  await launch(_url);
                                                                }, 
                                                                child: Text(AppLocalizations.of(context).translate('Privacy').toUpperCase(),
                                                                  style: Theme.of(context).textTheme.headline2,),
                                                              ),
                                                            ),

                                                        ],  

                                                    ),
                                                    Container(
                                                          padding: EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10,
                                                          ),
                                                          child: Text(
                                                            AppLocalizations.of(context).translate('InfoText5'),
                                                            style: Theme.of(context).textTheme.bodyText1,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                          Container(
                                                              padding: EdgeInsets.symmetric(
                                                                horizontal: 0,
                                                                vertical: 20,
                                                              ),
                                                              child: OutlinedButton(
                                                                  onPressed: () async{
                                                                      String _url = "https://cicadidae.systems/";
                                                                      await launch(_url);
                                                                  },                                                                   
                                                                  child: Text(AppLocalizations.of(context).translate('Cicaedaessystems').toUpperCase(),
                                                                  style: Theme.of(context).textTheme.headline2,),
                                                                ),
                                                              ),

                                                          ],  

                                                    ),
                                        ],
                                      ),
                                  ),
                              ),
                          ),
                      ],
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
          ),
      );
  
  }
}

