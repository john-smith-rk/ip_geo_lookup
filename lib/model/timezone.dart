class Timezone {
  final String? id;
  final String? abbr;
  final bool? isDst;
  final int? offset;
  final String? utc;
  final String? currentTime;

  Timezone({
    this.id,
    this.abbr,
    this.isDst,
    this.offset,
    this.utc,
    this.currentTime,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      id: json['id'],
      abbr: json['abbr'],
      isDst: json['is_dst'],
      offset: json['offset'],
      utc: json['utc'],
      currentTime: json['current_time'],
    );
  }

}