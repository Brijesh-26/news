import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

const API_KEY= '83132d96361c492eb3fb476716cf9b49';


class News_Channel extends StatefulWidget {

  String sa;

  News_Channel(this.sa);

  @override
  State<News_Channel> createState() => _News_ChannelState();
}

class _News_ChannelState extends State<News_Channel> {

  late List<Api_Model> list;
  Future<List<Api_Model>> getData(String s) async {
    s= widget.sa;
    String link =
        "https://newsapi.org/v2/everything?domains=$s&apiKey=$API_KEY";
    var res = await http.get(Uri.parse(link));


    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["articles"] as List;
      print(rest);
      list = rest.map<Api_Model>((json) => Api_Model.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");


    return list;
  }


  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget listViewWidget(List<Api_Model> api_model) {
    return Container(
      child: ListView.builder(
          itemCount: list.length,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
              color: Colors.black12,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 50.0,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        child: api_model[position].urlToImage == null
                            ? Icon(Icons.not_interested)
                            : Image.network('${api_model[position].urlToImage}',fit: BoxFit.cover,),

                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: Text(
                          '${api_model[position].title}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Expanded(
                      child: Text(
                        '${api_model[position].Desc}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final url_info= api_model[position].url.toString();

                          if(await canLaunch(url_info)){
                            await launch(
                                url_info,
                                forceSafariVC: true,
                              forceWebView: true,
                              enableJavaScript: true,
                            );
                          }
                        },
                        child: Text(
                          '${api_model[position].url}',
                          style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ultimate News'),
          backgroundColor: Colors.black54,
        ),

        body: FutureBuilder(
            future: getData('aajtak.in'),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return listViewWidget(snapshot.data as List<Api_Model>);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      )
    );
  }
}
