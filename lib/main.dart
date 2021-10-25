import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import './utils/AppLanguage.dart';
import 'utils/app_localizations.dart';

//import 'menu_screen.dart';
import 'screens/simple_screen.dart';
import 'screens/geo_screen.dart';
import 'screens/find_cicadas.dart';
import 'screens/call_cicadas.dart';
import 'screens/map_cicadas.dart';
import 'screens/info.dart';

import 'globals.dart' as globals;
import 'utils/cicadas_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {


  final AppLanguage appLanguage;


  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      tileMode: TileMode.repeated,
      colors: <Color>[Color(0xff72b956), Color(0xff578d63), Color(0xff677dab), Color(0xff7594bc)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 70.0));

    final Shader captionGradientInactive = LinearGradient(
      tileMode: TileMode.repeated,
      colors: <Color>[Color(0xffd9ba65), Color(0xffd3a756), Color(0xffa08a2a), Color(0xff72b956), Color(0xffacc954), Color(0xffcfb145)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 70.0));
    

    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('de', 'DE'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          initialRoute: '/',
          routes: {
            '/': (context) => AppLang(),
            '/simple': (context) => SimpleScreen(),
            '/geo': (context) => GeoScreen(),
            '/find': (context) => FindCicadas(),
            '/call': (context) => CallCicadas(), 
            '/map': (context) => MapCicadas(),
            '/info': (context) => InfoScreen(),
          },
          theme: ThemeData(
              backgroundColor: Color(0xffe9cdb3),
              fontFamily: 'Corbel',
              brightness: Brightness.light,
              primaryColor: Color(0xfff1d4c0),
              accentColor: Color(0xffb0cf6c),
              textTheme: TextTheme(
                headline5: TextStyle(fontFamily: 'ClaireFont', fontSize: 35.0, fontWeight: FontWeight.bold, foreground: new Paint()..shader = captionGradientInactive),
                bodyText1: TextStyle(fontSize: 22.0, fontFamily: 'Corbel', foreground: new Paint()..shader = linearGradient),
                bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Corbel', color: Colors.grey[700]),
                subtitle1: TextStyle(fontSize: 10.0, fontFamily: 'Corbel', foreground: new Paint()..shader = captionGradientInactive),
                subtitle2: TextStyle(fontSize: 10.0, fontFamily: 'Corbel', foreground: new Paint()..shader = linearGradient),
                headline2: TextStyle(fontFamily: 'ClaireFont', fontSize: 20.0, foreground: new Paint()..shader = captionGradientInactive),
                headline6: TextStyle(fontFamily: 'ClaireFont', fontSize: 18.0, foreground: new Paint()..shader = linearGradient),
                headline4: TextStyle(fontFamily: 'ClaireFont', fontSize: 18.0, foreground: new Paint()..shader = captionGradientInactive),

              ),
              appBarTheme: AppBarTheme(
                backgroundColor: Color(0xfff1d4c0),
                centerTitle: true, 
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xffe9c1ac),
                selectedItemColor: Color(0xffe96655),
                unselectedItemColor: Color(0xffee8a99),
                selectedIconTheme: IconThemeData(
                 color: Color(0xffe96655),
                 size: 28,
                ),
                unselectedIconTheme: IconThemeData(
                  color: Color(0xffee8a99),
                  size: 28,
                ),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  primary: Color(0xffb0cf6e),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  backgroundColor: Color(0xffe9c1ac).withOpacity(0.5),
                  onSurface: Color(0xffb0cf6e),
                  shadowColor: Color(0xffe9c1ac),
                ),
              ),
          ),        
          );
      }),
    );
  }
}



class AppLang extends StatelessWidget {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);

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
                      horizontal: 10,
                      vertical: 110,
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
                            child: Image.asset('assets/images/cicadagames_clairetolan.png'),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 10,
                            ),
                            child: Text(
                              AppLocalizations.of(context).translate('titleIntro').toUpperCase(),
                              textAlign: TextAlign.center, 
                              style: Theme.of(context).textTheme.headline4,
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
                                  onPressed: () {
                                    appLanguage.changeLanguage(Locale("en"));
                                    globals.selectedLanguage = "en";
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => GeoScreen()),
                                    );
                                  },
                                  child: Text('EN',
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ),
                            ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                OutlinedButton(
                                  onPressed: () {
                                    appLanguage.changeLanguage(Locale("de"));
                                    globals.selectedLanguage = "de";
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => GeoScreen()),
                                    );
                                  },
                                  child: Text('DE',
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                )
                              ]

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
