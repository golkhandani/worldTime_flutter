import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Inside build function you can
    // access to data from Navigator
    this.data =
        data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    bool isDay = data['isDayTime'];
    // set background
    String bgImage =
        data['isDayTime'] ? 'assets/day.jpeg' : 'assets/night.jpeg';
    print(data);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgImage), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 10),
                  child: FlatButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/locations');
                        setState(() {
                          data = {
                            'location': result['location'],
                            'flag': result['flag'],
                            'time': result['time'],
                            'isDayTime': result['isDayTime'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: isDay ? Colors.black : Colors.white,
                      ),
                      label: Text("Edit Location",
                          style: TextStyle(
                              color: isDay ? Colors.black : Colors.white))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: isDay ? Colors.black : Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(data['time'],
                    style: TextStyle(
                        fontSize: 80,
                        color: isDay ? Colors.black : Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
