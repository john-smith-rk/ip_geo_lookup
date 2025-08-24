import 'dart:convert';
import 'dart:io';

import 'package:ip_geo_lookup/model/ip_info.dart';
import 'package:ip_geo_lookup/service/ip_service.dart';
import 'package:ip_geo_lookup/utils/constants.dart';
import 'package:ip_geo_lookup/utils/log_utils.dart';

class IPServiceImpl extends IpService{

  @override
  Future<dynamic> getIpInfo() async {
    final httpClient = HttpClient();
    try {
      final uri = Uri.parse(Constants.url);
      final request = await httpClient.getUrl(uri);
      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final data = jsonDecode(responseBody);

        LogUtils.logD("Countries data:");
        if (data is Map<String, dynamic>) {
          LogUtils.logD("Data : $data");
          return data; // ✅ Return JSON list
        } else {
          return null; // Unexpected format
        }
      } else {
        LogUtils.logD("Error: ${response.statusCode}");
        return null;
      }
    } finally {
      httpClient.close();
    }
  }

}