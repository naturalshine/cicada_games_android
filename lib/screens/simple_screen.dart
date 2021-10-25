import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:wakelock/wakelock.dart';

import 'info.dart';

import '../globals.dart' as globals; 
class SimpleScreen extends StatefulWidget {
  SimpleScreen({Key key}) : super(key: key);

  @override
  _SimpleScreenState createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  UnityWidgetController _unityWidgetController;
    




  
  @override
  void initState() {
    super.initState();
    setState(() {
      Wakelock.enable();
      // You could also use Wakelock.toggle(on: true);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffe9cdb3),
      body: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              UnityWidget(
                onUnityCreated: _onUnityCreated,
                onUnityMessage: onUnityMessage,
              ),

            ],
          ),

        )

    );
  }

  void unityLoadScene(String name){
    
    _unityWidgetController.postMessage(
        'sceneManager',
        'loadScene',
        name,
      );

  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
    if(message == "quit"){
      _unityWidgetController.unload(); 
      print("QUITING BITTCHE");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoScreen()),
      );
    }
  }
  /*
  void onUnitySceneLoaded(SceneLoaded scene) {
    print('Received scene loaded from unity: ${scene.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');

  }
  */
  // Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    this._unityWidgetController = controller;
    //unityLoadScene(globals.selectedScene);
  }
}
