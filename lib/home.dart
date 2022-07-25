import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:news/card_data_model.dart';
import 'package:news/news_category.dart';
import 'package:news/news_channel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.decelerate, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }
  
  List<Card_Data_Model> cardData= [
    
    Card_Data_Model(image: Image.network('https://tse1.mm.bing.net/th?id=OIP.xZy01t2g2X1yYA_GaCG7zQHaEL&pid=Api&P=0',), name: 'Technology'),
    Card_Data_Model(image: Image.network('https://tse4.mm.bing.net/th?id=OIP.GyUFuXf1Q_BWTjzHHCYpwgHaEy&pid=Api&P=0',), name: 'Sports'),
    Card_Data_Model(image: Image.network('https://tse2.mm.bing.net/th?id=OIP.2Vi4kzlXUyXyqq8kzM6x4QHaEK&pid=Api&P=0',), name: 'Gaming'),
    Card_Data_Model(image: Image.network('https://tse3.mm.bing.net/th?id=OIP.eOOkMAKBv1YMNxrardUGLQHaE8&pid=Api&P=0',), name: 'Business'),
    Card_Data_Model(image: Image.network('https://tse3.mm.bing.net/th?id=OIP.bE7Qg6X9zDw-vvIXp3QCMgHaE7&pid=Api&P=0',), name: 'Politics'),
    Card_Data_Model(image: Image.network('https://tse3.explicit.bing.net/th?id=OIP.0qQ4TGdgQ5fiBKb4wVst9AHaE8&pid=Api&P=0',), name: 'Entertainment'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 20.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ultimate'),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'NEWS',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.pink.shade400,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70)))),
        body: Container(
          child: ListView.builder(
            shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 6,
              padding: const EdgeInsets.all(2.0),
              itemBuilder: (context, position) {
                return Card(
                  color: Colors.black12,
                  // clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 50.0,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(cardData[position].name== 'Technology') {
                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              return News_Category('Technology');
                            }));
                          }
                          if(cardData[position].name== 'Sports') {
                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              return News_Category('Sports');
                            }));
                          }

                          if(cardData[position].name== 'Gaming') {
                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              return News_Category('Gaming');
                            }));
                          }

                          if(cardData[position].name== 'Business') {
                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              return News_Category('Business');
                            }));
                          }

                          if(cardData[position].name== 'Politics') {
                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              return News_Category('Politics');
                            }));
                          }

                          if(cardData[position].name== 'Entertainment') {
                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              return News_Category('Entertainment');
                            }));
                          }
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                                child: cardData[position].image,
                            ),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              left: 16,
                              child: Center(
                                child: Text(
                                  cardData[position].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 48,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "AAJ TAK",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.access_alarm,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return News_Channel('aajtak.in');
                }));
                _animationController.reverse();
              },
            ),
            // Floating action menu item
            Bubble(
              title: "NDTV",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.accessible_forward,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return News_Channel('ndtv.com');
                }));
                _animationController.reverse();
              },
            ),
            //Floating action menu item
            Bubble(
              title: "REPUBLIC WORLD",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.account_balance,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return News_Channel('republicworld.com');
                }));
                // write some code
                _animationController.reverse();
              },
            ),

            Bubble(
              title: "BBC",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.abc_sharp,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return News_Channel('bbc.com');
                }));
                // write some code
                _animationController.reverse();
              },
            ),

            Bubble(
              title: "ALJAZEERA",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.adobe_rounded,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return News_Channel('aljazeera.com');
                }));
                // write some code
                _animationController.reverse();
              },
            ),

            Bubble(
              title: "CNN",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.add_business_outlined,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return News_Channel('cnn.com');
                }));
                // write some code
                _animationController.reverse();
              },
            ),

            Bubble(
              title: "THE MOSCOW TIMES",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.add_chart_outlined,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                // write some code
                _animationController.reverse();
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation state
          onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),

          // Floating Action button Icon color
          iconColor: Colors.blue,

          // Flaoting Action button Icon
          iconData: Icons.ac_unit,
          backGroundColor: Colors.white,
        ));
  }
}
