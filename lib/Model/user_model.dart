class NewsModel {
  late int id;
  late String title;
  late String content;
  late String imageUrl;
  late String date;
  late String tag;
  NewsModel(
      this.id, this.title, this.content, this.imageUrl, this.date, this.tag);

  // fromjson
  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    title = json['title']['rendered'] ?? "";
    content = json['content']['rendered'] ?? "";
    imageUrl = json["_embedded"]["wp:featuredmedia"][0]["source_url"] ?? "";
    date = json['date'] ?? "";
    tag = json['yoast_head_json']['schema']['@graph'][0]['articleSection'][0] ??
        "";
  }

  // tojson
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["id"] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['imageUrl'] = imageUrl;
    _data['date'] = date;
    _data['tag'] = tag;
    return _data;
  }
}
