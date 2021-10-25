import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;

degreesToRadians(degrees) {
  return degrees * math.pi / 180;
}

distanceInKmBetweenEarthCoordinates(coordinateMap) {
  var earthRadiusKm = 6371;

  var dLat = degreesToRadians(coordinateMap["viennaLat"]-coordinateMap["yourLat"]);
  var dLon = degreesToRadians(coordinateMap["viennaLong"]-coordinateMap["yourLong"]);

  var viennaLat = degreesToRadians(coordinateMap["viennaLat"]);
  var yourLat = degreesToRadians(coordinateMap["yourLat"]);

  var a = math.sin(dLat/2) * math.sin(dLat/2) +
          math.sin(dLon/2) * math.sin(dLon/2) * math.cos(viennaLat) * math.cos(yourLat); 
  var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a)); 
  return earthRadiusKm * c;
}

returnMapLink(Position location){
    //https://www.google.com/maps/dir/?api=1&origin=34.1030032,-118.41046840000001&destination=34.059808,-118.368152
    String viennaLat = "48.221642";
    String viennaLong = "16.308336";
    String userLat = location.latitude.toString(); 
    String userLong = location.longitude.toString(); 

    String link = "https://www.google.com/maps/dir/?api=1&origin=" + userLat + "," + userLong + "&destination=" + viennaLat + "," + viennaLong;

    return link;

}


distanceToCicadas(Position location){
  Map<String, double> coordinates = {
    'viennaLat': 48.221642,
    'viennaLong': 16.308336,
  }; 

  coordinates['yourLat'] = location.latitude;
  coordinates['yourLong'] = location.longitude;


  var distance = distanceInKmBetweenEarthCoordinates(coordinates);

  return distance;


}


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;


  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }


  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permantly denied, we cannot request permissions.');
  }


  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return Future.error(
          'Location permissions are denied (actual value: $permission).');
    }
  }

  
  Position location;
  location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
    .timeout(Duration(seconds: 5), onTimeout: () async {
          //developer.log('getPosition() timeout. Trying Android Location Manager');
          Position tryAgainLocation;
          tryAgainLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true);
          return tryAgainLocation;
          });

  //developer.log('getPosition() got position=$location');


  return location;

}