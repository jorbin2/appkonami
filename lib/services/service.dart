//before let's add the http package
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/modelapi.dart';


class SoccerApi {





  final JsonDecoder _decoder = const JsonDecoder();

  Future<List<Matches>> getAllMatchs() async {
     String api= 'https://app.sportdataapi.com/api/'
         'v1/soccer/matches?apikey=91e5bba0-8fc6-11ec'
         '-8a68-596572b37efe&season_id=3188&date_from=2022-08-13';
    final Uri apiUrl =  Uri.parse(api);

    Response res = await get(apiUrl);

     List<Matches> matches= [];


      var body;
      print("statuscode");
      print(res.statusCode);

      if (res.statusCode == 200) {
        // this mean that we are connected to the data base
        body = jsonDecode(res.body);
        List<dynamic> matchesList = body['data'] ;
        // to debug

        print("maping");

        for (var item in matchesList) {
          print("create");
          var match=  Matches(matchId: item['match_id'], statusCode: item['status_code'], status: item['status'],
              matchStart: item['match_start'], matchStartIso: item['match_start_iso'], minute: item['minute'], leagueId: item['league_id'], seasonId: item['season_id'] ,  homeTeam: item['home_team'], awayTeam: item['away_team'],
              stats: item['stats']);
          matches.add(match);
          print("match");
          print(match);

        }

    print (matches);


      }
     return matches;
    }


}