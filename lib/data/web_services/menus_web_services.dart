import 'dart:convert';

import 'package:flutter/services.dart';

import '../../helpers/app_constants.dart';
import '../../helpers/extension.dart';
import '../interfaces/menui.dart';

class MenusWebServices implements MenuInterface {
  @override
  Future<List<dynamic>> getMenuSections() async {
    try {
      final String response =
          await rootBundle.loadString(AppConstants.localJson, cache: true);
      final parsedJson =
          await json.decode(response)["sections"] as List<dynamic>;

      return parsedJson;
    } catch (e) {
      Helpers.logger("error while parsing json ${e.toString()}");
      return [];
    }
  }
}
