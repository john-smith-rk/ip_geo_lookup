class Connection {
  final int? asn;
  final String? org;
  final String? isp;
  final String? domain;

  Connection({this.asn, this.org, this.isp, this.domain});

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      asn: json['asn'],
      org: json['org'],
      isp: json['isp'],
      domain: json['domain'],
    );
  }
}