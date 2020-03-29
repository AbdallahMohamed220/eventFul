import 'package:carousel_pro/carousel_pro.dart';
import 'package:eventful_app/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _username = Provider.of<Auth>(context, listen: false).username;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
                child: Text(
                  'HI $_username',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 220,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  child: Carousel(
                    images: [
                      ExactAssetImage(
                        "assets/images/event1.jpeg",
                      ),
                      ExactAssetImage(
                        "assets/images/event2.jpeg",
                      ),
                      ExactAssetImage(
                        "assets/images/event3.jpeg",
                      ),
                      ExactAssetImage(
                        "assets/images/event4.jpeg",
                      ),
                    ],
                    showIndicator: true,
                    animationDuration: Duration(seconds: 2),
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.white,
                    autoplay: true,
                    indicatorBgPadding: 5.0,
                    borderRadius: true,
                    onImageChange: (_, __) {},
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.all(8),
                //   child: Container(
                //     height: 200,
                //     width: MediaQuery.of(context).size.width - 20,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.grey.withOpacity(0.3),
                //             spreadRadius: 3.0,
                //             blurRadius: 5.0),
                //       ],
                //       color: Colors.white,
                //     ),
                //     child: Column(
                //       children: <Widget>[
                //         Hero(
                //           tag: '1',
                //           child: InkWell(
                //             onTap: () {},
                //             child: Container(
                //               height: 70,

                //               width: 100,
                //               // decoration: BoxDecoration(
                //               //   image: DecorationImage(
                //               //     image: AssetImage(
                //               //       'assets/images/event1.jpeg',
                //               //     ),
                //               //   ),
                //               // ),
                //               child: CircleAvatar(
                //                 backgroundImage: AssetImage(
                //                   'assets/images/event1.jpeg',
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(height: 5),
                //         Text(
                //           'price',
                //         ),
                //         SizedBox(height: 5),
                //         Text(
                //           'name',
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(top: 5),
                //           child: Container(
                //             color: Color(0xffebebeb),
                //             height: 1,
                //           ),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             IconButton(
                //               icon: Icon(
                //                 Icons.favorite_border,
                //                 color: Color(0xFFD17E50),
                //                 size: 20.0,
                //               ),
                //               onPressed: () {},
                //             ),
                //             InkWell(
                //               child: Text("Book"),
                //             ),

                //             // ]
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: 600,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: 200,
                                  child: Image.asset(
                                    'assets/images/event1.jpeg',
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.yellow,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  width: 270,
                                  color: Colors.black54,
                                  child: Text(
                                    'Running Event',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 4),
                                      child: Icon(
                                        Icons.schedule,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      '26 Feb',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 4),
                                      child: Icon(
                                        Icons.schedule,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      '28 Feb',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: MaterialButton(
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Theme.of(context).primaryColor,
                                        splashColor: Colors.grey,
                                        onPressed: () {},
                                        minWidth: 80.0,
                                        height: 35.0,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Book',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Icon(
                                                Icons.fast_forward,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: 600,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: 200,
                                  child: Image.asset(
                                    'assets/images/event2.jpeg',
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.yellow,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  width: 270,
                                  color: Colors.black54,
                                  child: Text(
                                    'Walking Event',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 4),
                                      child: Icon(
                                        Icons.schedule,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      '26 Feb',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 4),
                                      child: Icon(
                                        Icons.schedule,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      '28 Feb',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: MaterialButton(
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Theme.of(context).primaryColor,
                                        splashColor: Colors.grey,
                                        onPressed: () {},
                                        minWidth: 80.0,
                                        height: 33.0,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Book',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Icon(
                                                Icons.fast_forward,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
