import 'package:ip_geo_lookup/model/ip_info.dart';

import 'repository/ip_info_repository.dart';

class IPGeoLookupUtility{
  static Future<IPInfo?> getIPInfo() async {
    return await IpInfoRepository.getIPInfo();
  }
}