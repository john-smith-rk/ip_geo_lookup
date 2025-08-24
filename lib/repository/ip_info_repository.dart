import 'package:ip_geo_lookup/model/ip_info.dart';
import 'package:ip_geo_lookup/service/ip_service.dart';
import 'package:ip_geo_lookup/service/ip_service_impl.dart';

class IpInfoRepository{

  static Future<IPInfo?> getIPInfo() async {

    final IpService service = IPServiceImpl();

    dynamic? data;
    data = await service.getIpInfo();

    if(data != null) {
      return IPInfo.fromJson(data);
    }

    return null;
  }
}