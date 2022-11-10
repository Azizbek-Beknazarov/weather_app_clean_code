import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HourlyObHavo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bugun",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //       return DetailPage();
                  //     }));
                },
                child: Row(
                  children: [
                    Text(
                      "7 kunlik ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),

          Container(
            height: MediaQuery.of(context).size.height - 650,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: Colors.white),
                  borderRadius: BorderRadius.circular(35)),
              child: Column(
                children: [
                  Text("23\u00B0",
                    // weather.current.toString() + "\u00B0",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image(
                    image: AssetImage('images/snow.png'),
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('12:00',
                    // weather.time,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
                SizedBox(width: 3,),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Column(
                    children: [
                      Text("23\u00B0",
                        // weather.current.toString() + "\u00B0",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        image: AssetImage('images/snow.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('12:00',
                        // weather.time,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 3,),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Column(
                    children: [
                      Text("23\u00B0",
                        // weather.current.toString() + "\u00B0",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        image: AssetImage('images/snow.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('12:00',
                        // weather.time,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 3,),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Column(
                    children: [
                      Text("23\u00B0",
                        // weather.current.toString() + "\u00B0",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        image: AssetImage('images/snow.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('12:00',
                        // weather.time,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 3,),
                Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: Colors.white),
                  borderRadius: BorderRadius.circular(35)),
              child: Column(
                children: [
                  Text("23\u00B0",
                    // weather.current.toString() + "\u00B0",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image(
                    image: AssetImage('images/snow.png'),
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('12:00',
                    // weather.time,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
                SizedBox(width: 3,),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Column(
                    children: [
                      Text("23\u00B0",
                        // weather.current.toString() + "\u00B0",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        image: AssetImage('images/snow.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('12:00',
                        // weather.time,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 3,),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Column(
                    children: [
                      Text("23\u00B0",
                        // weather.current.toString() + "\u00B0",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        image: AssetImage('images/snow.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('12:00',
                        // weather.time,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),

                // Card(color: Colors.blue,child: Text('22'),),

              ],),
            ),
          ),
          // ListView.builder(
          //  itemCount: 3,
          //    shrinkWrap: true,
          //    // scrollDirection: Axis.horizontal,
          //    itemBuilder: (context, index) {
          //      return ObHavoWidget();
          //    }),
        ],
      ),
    );
  }
}

class ObHavoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          Text(
            "11\u00B0",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage('images/thunder.png'),
            width: 50,
            height: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '  12',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
