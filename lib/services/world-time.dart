import 'dart:convert';
import 'package:flutterapp/responses/ip-request.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the ui
  String time; // time in that location
  String flag; // url to asset flac icon
  String url; // location url for the api endpoint
  bool isDayTime; // true or false for day or night

  WorldTime({this.url}) {
    this.location = !isNullEmptyOrFalse(this.url)
        ? (this.url.split("/")[1]).replaceAll("_", " ")
        : "";
  }

  Future<void> getData() async {
    String endpoint =
        !isNullEmptyOrFalse(this.url) ? "timezone/${this.url}" : "ip";
    http.Response response =
        await http.get("http://worldtimeapi.org/api/$endpoint");

    Map dataMap = jsonDecode(response.body);
    IpRequest data = IpRequest.fromJson(dataMap);
    String datetime = data.datetime.toString();
    String offsetHour = data.utcOffset.toString().substring(1, 3);
    String offsetMin = data.utcOffset.toString().substring(4, 6);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsetHour)));
    now = now.add(Duration(minutes: int.parse(offsetMin)));
    print(dataMap);
    print(datetime);

    this.location = (data.timezone.split("/")[1]).replaceAll("_", " ");
    this.time = DateFormat.jm().format(now);
    this.isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    print(this.time);
  }
}

bool isNullEmptyOrFalse(Object o) => o == null || false == o || "" == o;
