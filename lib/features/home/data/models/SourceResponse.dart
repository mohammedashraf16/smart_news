class SourceResponse {
  SourceResponse({
      this.status, 
      this.sources,});

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
  String? status;
  List<Sources>? sources;
SourceResponse copyWith({  String? status,
  List<Sources>? sources,
}) => SourceResponse(  status: status ?? this.status,
  sources: sources ?? this.sources,
);


}

class Sources {
  Sources({
      this.id, 
      this.name, 
      this.description, 
      this.url, 
      this.category, 
      this.language, 
      this.country,});

  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;
Sources copyWith({  String? id,
  String? name,
  String? description,
  String? url,
  String? category,
  String? language,
  String? country,
}) => Sources(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  url: url ?? this.url,
  category: category ?? this.category,
  language: language ?? this.language,
  country: country ?? this.country,
);

}