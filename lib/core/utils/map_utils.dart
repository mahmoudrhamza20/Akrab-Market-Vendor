import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static void getUserLocation(Function(Position) position) async {
    determinePosition().then((value) {
      position(value!);
      Fluttertoast.showToast(
          msg: "تم تحديد موقعك",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  static Future<Position?> determinePosition() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      log('Errror Request Permission');
    });
    return await Geolocator.getCurrentPosition();
  }
}
