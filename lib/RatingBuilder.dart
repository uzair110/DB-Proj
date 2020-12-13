import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/myrating.dart';
import 'package:psych_help/services.dart';
import 'package:rating_bar/rating_bar.dart';

class UsrPsychRevList extends StatefulWidget {
  final int pid;

  UsrPsychRevList({this.pid});
  @override
  _UsrPsychRevList createState() => _UsrPsychRevList();
}

class _UsrPsychRevList extends State<UsrPsychRevList> {
  final int pid;
  _UsrPsychRevList({this.pid});
  // UsrPsychList({this.first_name, this.last_name, this.id})
  double avgRat = 0.0;
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else if (revs == [] || revs.length == 0) {
      print("Nothing to see here");
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      avgRat.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Text(
                      'Average Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Reviews',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text("No Items to Display"),
        ),
      ]);
    } else {
      List<double> ratLst = List<double>.from(revs.map((val) {
        return val.rating;
      }));
      var count = ratLst.length;
      avgRat = ratLst.reduce((a, b) => a + b) / count;
      print(avgRat);
      return Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        avgRat.toStringAsFixed(1),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        'Average Rating',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              'Reviews',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: revs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text(
                        revs[index].firstName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                        textAlign: TextAlign.left,
                      ),
                      RatingBar.readOnly(
                        size: 20,
                        initialRating: revs[index].rating,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        filledColor: Colors.green,
                        emptyIcon: Icons.star_border,
                      ),
                      Text(
                        revs[index].review,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      FlatButton(
                        color: Colors.grey,
                        onPressed: () {},
                        child: Text(
                          "Report Review",
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ],
      );
    }
  }
}

class ModPsychRevList extends StatefulWidget {
  final int pid;

  ModPsychRevList({this.pid});
  @override
  _ModPsychRevList createState() => _ModPsychRevList();
}

class _ModPsychRevList extends State<ModPsychRevList> {
  final int pid;
  _ModPsychRevList({this.pid});

  double avgRat = 0.0;
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else if (revs == [] || revs.length == 0) {
      print("Nothing to see here");
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      avgRat.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Text(
                      'Average Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Reviews',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text("No Items to Display"),
        ),
      ]);
    } else {
      List<double> ratLst = List<double>.from(revs.map((val) {
        return val.rating;
      }));
      var count = ratLst.length;
      avgRat = ratLst.reduce((a, b) => a + b) / count;
      print(avgRat);
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      avgRat.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Text(
                      'Average Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Reviews',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: revs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                  showDialog(
                    //User friendly error message when the screen has been displayed
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        "Delete This Rating",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28),
                      ),
                      content: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListBody(
                          mainAxis: Axis.vertical,
                          children: <Widget>[
                            Icon(Icons.delete_forever,
                                color: Colors.red[300], size: 50),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            final result = await AppServices.blacklist();
                            print(result);
                          },
                          child: Text("Blacklist " + revs[index].firstName),
                        ),
                        FlatButton(
                          onPressed: () async {},
                          child: Text("Delete"),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text("Cancel"),
                        )
                      ],
                    ),
                    barrierDismissible: false,
                  );
                },
                child: new Card(
                  child: Column(
                    children: <Widget>[
                      Text(
                        revs[index].firstName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                        textAlign: TextAlign.left,
                      ),
                      RatingBar.readOnly(
                        size: 20,
                        initialRating: revs[index].rating,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        filledColor: Colors.green,
                        emptyIcon: Icons.star_border,
                      ),
                      Text(
                        revs[index].review,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      //await ()
                    ],
                  ),
                ),
              );
            }),
      ]);
    }
  }
}

class UsrRevList extends StatefulWidget {
  @override
  _UsrRevList createState() => _UsrRevList();
}

class _UsrRevList extends State<UsrRevList> {
  // UsrPsychList({this.first_name, this.last_name, this.id})
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else if (revs == [] || revs.length == 0) {
      print("Nothing to see here");
      return Center(
        child: Text("No Items to Display"),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: revs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditRating(
                            ratID: revs[index].ratID,
                            revID: revs[index].revID,
                            theReview: revs[index].review,
                            theRating: revs[index].rating,
                          )),
                );
              },
              onLongPress: () {
                showDialog(
                  //User friendly error message when the screen has been displayed
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "Delete This Rating",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28),
                    ),
                    content: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ListBody(
                        mainAxis: Axis.vertical,
                        children: <Widget>[
                          Icon(Icons.delete_forever,
                              color: Colors.red[300], size: 50),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () async {},
                        child: Text("Delete"),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Cancel"),
                      )
                    ],
                  ),
                  barrierDismissible: false,
                );
              },
              child: new Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Psychologist: Dr. ${revs[index].psyfirstName} ${revs[index].psylastName}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    RatingBar.readOnly(
                      size: 20,
                      initialRating: revs[index].rating,
                      isHalfAllowed: true,
                      halfFilledIcon: Icons.star_half,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                    ),
                    Text(
                      revs[index].review,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
}
