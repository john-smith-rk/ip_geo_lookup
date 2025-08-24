class Flag {
  final String? img;
  final String? emoji;
  final String? emojiUnicode;

  Flag({this.img, this.emoji, this.emojiUnicode});

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
      img: json['img'],
      emoji: json['emoji'],
      emojiUnicode: json['emoji_unicode'],
    );
  }
}