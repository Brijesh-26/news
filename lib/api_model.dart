class Api_Model {

  String? title;
  String? Desc;
  String? url;
  String? urlToImage;
  String? content;

  Api_Model({this.title, this.Desc, this.url, this.urlToImage, this.content});

  factory Api_Model.fromJson(Map<String, dynamic> json) {
    return Api_Model(

        title: json["title"],
        Desc: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        content: json["content"]);
  }
}