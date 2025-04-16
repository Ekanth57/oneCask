import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Collection/domain /bottle_model.dart';

// Fetch bottles from local JSON or from shared preferences (offline)
Future<List<Bottle>> fetchBottles() async {
  bool isOnline = await isConnectedToInternet();  // Check for internet connection

  if (isOnline) {
    final String data = await rootBundle.loadString('assets/data/bottle_data.json');
    final Map<String, dynamic> jsonMap = json.decode(data);  // Decode JSON data
    List<dynamic> jsonBottles = jsonMap['bottles'];  // Extract the list of bottles

    // Convert the list of JSON objects into a list of Bottle objects
    return jsonBottles.map((bottleJson) => Bottle.fromJson(bottleJson)).toList();
  } else {
    // Fetch offline bottles from SharedPreferences if offline
    return await getOfflineBottles();
  }
}

// Check for internet connectivity (use connectivity_plus or similar package)
Future<bool> isConnectedToInternet() async {

  return true;
}

// Fetch offline bottles from SharedPreferences
Future<List<Bottle>> getOfflineBottles() async {
  final prefs = await SharedPreferences.getInstance();
  String? bottlesData = prefs.getString('bottles');  // Get stored data

  if (bottlesData != null) {
    List<dynamic> jsonBottles = jsonDecode(bottlesData);  // Decode stored JSON data
    return jsonBottles.map((bottleJson) => Bottle.fromJson(bottleJson)).toList();
  }
  return [];  // Return empty list if no data is found
}
