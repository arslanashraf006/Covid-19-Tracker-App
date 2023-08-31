import 'dart:convert';

import '../Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/world_states_model.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi () async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if(response.statusCode == 200){
       data = json.decode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }
  }
}