//before let's add the http package
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/modelapi.dart';


class SoccerApi {





  final JsonDecoder _decoder = new JsonDecoder();

  Future<List<Matches>> getAllMatchs()  async {
     String api= 'https://app.sportdataapi.com/api/v1/soccer/matches?apikey=91e5bba0-8fc6-11ec-8a68-596572b37efe&season_id=3188&date_from=2022-08-12';
    final Uri apiUrl =  Uri.parse(api);

    Response res = await get(apiUrl);


    late List<Matches> matches;
      var body;

      if (res.statusCode == 200) {
        // this mean that we are connected to the data base
        body = jsonDecode(res.body);
        List<dynamic> matchesList = body['data'];
        // to debug
        matches = matchesList
            .map((dynamic item) => Matches.fromJson(item))
            .toList();

      }else{
        matches=[];
      }
   print(matches);
    return matches;
    }


}