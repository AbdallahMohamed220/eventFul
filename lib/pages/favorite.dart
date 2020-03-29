import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FavoriteWidget(),
        // FavoriteWidget(),
        // FavoriteWidget(),
      ],
    );
  }
}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                      Icons.favorite,
                      color: Colors.yellow,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 270,
                    color: Colors.black54,
                    child: Text(
                      'Running Event',
                      style: TextStyle(fontSize: 24, color: Colors.white),
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
                        padding: const EdgeInsets.only(left: 10.0, right: 4),
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
                        padding: const EdgeInsets.only(left: 20.0, right: 4),
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
                        padding: const EdgeInsets.only(left: 30.0),
                        child: MaterialButton(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
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
                                padding: const EdgeInsets.only(left: 4.0),
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
    );
  }
}
