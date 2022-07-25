class Category_Api_Model {

  String? title;
  String? Desc;
  String? url;
  String? urlToImage;
  String? content;

  Category_Api_Model({this.title, this.Desc, this.url, this.urlToImage, this.content});

  factory Category_Api_Model.fromJson(Map<String, dynamic> json) {
    return Category_Api_Model(

        title: json["title"],
        Desc: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        content: json["content"]);
  }
}