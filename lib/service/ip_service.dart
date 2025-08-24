import 'package:ip_geo_lookup/model/ip_info.dart';

abstract class IpService{
   Future<dynamic> getIpInfo();
}