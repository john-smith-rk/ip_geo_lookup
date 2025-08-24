import 'package:ip_geo_lookup/helper/border_helper.dart';
import 'package:ip_geo_lookup/model/connection.dart';
import 'package:ip_geo_lookup/model/flag.dart';

import 'timezone.dart';

class IPInfo{
  final String? ip;
  final bool? success;
  final String? type;
  final String? continent;
  final String? continentCode;
  final String? country;
  final String? countryCode;
  final String? region;
  final String? regionCode;
  final String? city;
  final double? latitude;
  final double? longitude;
  final bool? isEu;
  final String? postal;
  final String? callingCode;
  final String? capital;
  final List<String>? borders;
  final Flag? flag;
  final Connection? connection;
  final Timezone? timezone;

  IPInfo({
    this.ip,
    this.success,
    this.type,
    this.continent,
    this.continentCode,
    this.country,
    this.countryCode,
    this.region,
    this.regionCode,
    this.city,
    this.latitude,
    this.longitude,
    this.isEu,
    this.postal,
    this.callingCode,
    this.capital,
    this.borders,
    this.flag,
    this.connection,
    this.timezone
  });

  factory IPInfo.fromJson(Map<String, dynamic> json) {
    return IPInfo(
      ip: json['ip'],
      success: json['success'],
      type: json['type'],
      continent: json['continent'],
      continentCode: json['continent_code'],
      country: json['country'],
      countryCode: json['country_code'],
      region: json['region'],
      regionCode: json['region_code'],
      city: json['city'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isEu: json['is_eu'],
      postal: json['postal'],
      callingCode: json['calling_code'],
      capital: json['capital'],
      borders: (json['borders'] as String?) != null? BorderHelper.getBorderCountryNames(json['borders']) : [],
      flag: json['flag'] != null ? Flag.fromJson(json['flag']) : null,
      connection: json['connection'] != null ? Connection.fromJson(json['connection']) : null,
      timezone: json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null,
    );
  }

}