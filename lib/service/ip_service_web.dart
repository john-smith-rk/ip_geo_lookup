import 'dart:convert';
import 'dart:html' as html;
import 'package:ip_geo_lookup/service/ip_service.dart';
import 'package:ip_geo_lookup/utils/constants.dart';
import 'package:ip_geo_lookup/utils/log_utils.dart';

class IPServiceImpl extends IpService{

  @override
  Future<dynamic> getIpInfo() async {
    try {
      final response = await html.HttpRequest.getString(Constants.url);
      final data = jsonDecode(response);
      if (data is Map<String, dynamic>) return data;
      return null;
    } catch (e) {
      LogUtils.logD("Web error: $e");
      return null;
    }
  }

}