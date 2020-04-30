import 'dart:convert';

IpRequest ipRequestFromJson(String str) => IpRequest.fromJson(json.decode(str));

String ipRequestToJson(IpRequest data) => json.encode(data.toJson());

class IpRequest {
  int weekNumber;
  String utcOffset;
  DateTime utcDatetime;
  int unixtime;
  String timezone;
  int rawOffset;
  DateTime dstUntil;
  int dstOffset;
  DateTime dstFrom;
  bool dst;
  int dayOfYear;
  int dayOfWeek;
  DateTime datetime;
  String clientIp;
  String abbreviation;

  IpRequest({
    this.weekNumber,
    this.utcOffset,
    this.utcDatetime,
    this.unixtime,
    this.timezone,
    this.rawOffset,
    this.dstUntil,
    this.dstOffset,
    this.dstFrom,
    this.dst,
    this.dayOfYear,
    this.dayOfWeek,
    this.datetime,
    this.clientIp,
    this.abbreviation,
  });

  factory IpRequest.fromJson(Map<String, dynamic> json) => IpRequest(
        weekNumber: json["week_number"] == null ? null : json["week_number"],
        utcOffset: json["utc_offset"] == null ? null : json["utc_offset"],
        utcDatetime: json["utc_datetime"] == null
            ? null
            : DateTime.parse(json["utc_datetime"]),
        unixtime: json["unixtime"] == null ? null : json["unixtime"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        rawOffset: json["raw_offset"] == null ? null : json["raw_offset"],
        dstUntil: json["dst_until"] == null
            ? null
            : DateTime.parse(json["dst_until"]),
        dstOffset: json["dst_offset"] == null ? null : json["dst_offset"],
        dstFrom:
            json["dst_from"] == null ? null : DateTime.parse(json["dst_from"]),
        dst: json["dst"] == null ? null : json["dst"],
        dayOfYear: json["day_of_year"] == null ? null : json["day_of_year"],
        dayOfWeek: json["day_of_week"] == null ? null : json["day_of_week"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
        abbreviation:
            json["abbreviation"] == null ? null : json["abbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "week_number": weekNumber == null ? null : weekNumber,
        "utc_offset": utcOffset == null ? null : utcOffset,
        "utc_datetime":
            utcDatetime == null ? null : utcDatetime.toIso8601String(),
        "unixtime": unixtime == null ? null : unixtime,
        "timezone": timezone == null ? null : timezone,
        "raw_offset": rawOffset == null ? null : rawOffset,
        "dst_until": dstUntil == null ? null : dstUntil.toIso8601String(),
        "dst_offset": dstOffset == null ? null : dstOffset,
        "dst_from": dstFrom == null ? null : dstFrom.toIso8601String(),
        "dst": dst == null ? null : dst,
        "day_of_year": dayOfYear == null ? null : dayOfYear,
        "day_of_week": dayOfWeek == null ? null : dayOfWeek,
        "datetime": datetime == null ? null : datetime.toIso8601String(),
        "client_ip": clientIp == null ? null : clientIp,
        "abbreviation": abbreviation == null ? null : abbreviation,
      };
}
