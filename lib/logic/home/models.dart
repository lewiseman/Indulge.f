import 'dart:convert' as convert;

List<Story> storyFromJson(String body) {
  final jsonData = convert.jsonDecode(body);
  //final jsonBody = jsonData['results'];
  return List<Story>.from(jsonData.map((dynamic body) => Story.fromJson(body)));
}

class Story {
  int id;
  String owner;
  String title;
  String date;
  String story;
  String category;
  String tags;
  int viewers;

  Story({
    this.id,
    this.owner,
    this.title,
    this.date,
    this.story,
    this.category,
    this.tags,
    this.viewers,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json['id'],
        owner: json['owner'],
        title: json['title'],
        date: json['date'],
        story: json['story'],
        category: json['category'],
        tags: json['tags'],
        viewers: json['viewers'],
      );
}
