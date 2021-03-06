import 'package:flutter/material.dart';
import 'package:psych_help/Sidebars.dart';
import 'package:psych_help/editpsych.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/RatingBuilder.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Mapper.dart';

class PsyProfileMod extends StatefulWidget {
  final String firstName, lastName, city, address, email, ctype;
  final int pid, number;

  @override
  PsyProfileMod(
      {this.firstName,
      this.lastName,
      this.pid,
      this.city,
      this.number,
      this.address,
      this.email,
      this.ctype});
  _PsyProfileMod createState() => _PsyProfileMod();
}

String fname;
String review = '';
String result = '';
String globalId = '';
// String avgRating = '';

List<String> litems = [];
Widget cancelButton = FlatButton(
  child: Text("Cancel"),
  onPressed: () {},
);
Widget continueButton = FlatButton(
  child: Text("Continue"),
  onPressed: () {},
);

class _PsyProfileMod extends State<PsyProfileMod> {
  Future getData() async {
    // final response = await AppServices.getRating(widget.pid);
    // avgRating = response;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return StreamProvider<List<PsychRevData>>.value(
        value: AppServices.viewPsychRevUsr(widget.pid).asStream(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
              title: Text('Psychologist Details'),
              backgroundColor: Colors.green),
          drawer: SideBarMod(),
          resizeToAvoidBottomPadding: false,
          body: ListView(
            children: <Widget>[
              Container(
                //height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.green.shade300],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.firstName}" + " " + "${widget.lastName}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'City: ' + '${widget.city}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Phone Number: ' + '${widget.number}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Email: ' + '${widget.email}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Counselling Type: ' + '${widget.ctype}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Address: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${widget.address}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: Container(
              //           color: Colors.green.shade300,
              //           child: ListTile(
              //             title: Text(
              //               avg_rating,
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 30,
              //                 color: Colors.white,
              //               ),
              //             ),
              //             subtitle: Text(
              //               'Average Rating',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 color: Colors.white70,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 60),
                        Container(
                          height: 40.0,
                          width: 275.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.red,
                            color: Colors.red,
                            elevation: 7.0,
                            child: Container(
                                child: InkWell(
                                    hoverColor: Colors.red,
                                    splashColor: Colors.blueAccent,
                                    onTap: () async {
                                      showDialog(
                                        //User friendly error message when the screen has been displayed
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text(
                                            "Are you sure you want to delete " +
                                                "${widget.firstName}" +
                                                " " +
                                                "${widget.lastName}" +
                                                "?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            FlatButton(
                                              onPressed: () async {
                                                globalId = '${widget.pid}';
                                                result =
                                                    await AppServices.psychDel(
                                                        widget.pid);
                                                print(result);
                                                if (result ==
                                                    "Success Deletion") {
                                                  Navigator.pop(context);
                                                } else {
                                                  showDialog(
                                                    //User friendly error message when the screen has been displayed
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                      title: Text(
                                                        "Connection Failure",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 28),
                                                      ),
                                                      content:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        child: ListBody(
                                                          mainAxis:
                                                              Axis.vertical,
                                                          children: <Widget>[
                                                            Icon(Icons.clear,
                                                                color: Colors
                                                                    .red[300],
                                                                size: 50),
                                                            // Text(
                                                            //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    barrierDismissible: true,
                                                  );
                                                }
                                                Navigator.pop(context);
                                              },
                                              child: Text("Continue"),
                                            ),
                                          ],
                                          content: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: ListBody(
                                              mainAxis: Axis.vertical,
                                              children: <Widget>[
                                                Icon(Icons.clear,
                                                    color: Colors.red[300],
                                                    size: 50),
                                                // Text(
                                                //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                              ],
                                            ),
                                          ),
                                        ),
                                        barrierDismissible: true,
                                      );
                                    },
                                    child: Center(
                                      child: Text("Delete",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 160),
                        Container(
                          child: InkWell(
                            onTap: () {
                              print("kafi pehle: ${widget.ctype}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditPsych(
                                          email1: widget.email,
                                          ctype: widget.ctype,
                                          address1: widget.address,
                                          firstName: '${widget.firstName}',
                                          lastName: '${widget.lastName}',
                                          pid: widget.pid,
                                          city1: widget.city,
                                          number: widget.number,
                                        )), // Ye daal dena iss ke andar {this.firstName, this.lastName, this.pid, this.city, this.address, this.email, this.number}
                              );
                            },
                            child: Text('Edit Details',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                          ),
                        ),
                      ],
                    ),
                    ModPsychRevList(
                      pid: widget.pid,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
