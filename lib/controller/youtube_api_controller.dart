import 'package:youtube_api/model/youtube_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Welcome> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://hpu.cliprz.org/api/youtube'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Welcome.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}