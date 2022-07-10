import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) {
  // return rootBundle.loadString(assetsPath).then((file) => file.toString());
  return Future.delayed(Duration(seconds: 1), () {
    return rootBundle.loadString(assetsPath).then((file) => file.toString());
  });
}
