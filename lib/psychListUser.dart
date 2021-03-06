import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/psychProfileUsr.dart';

class UsrPsychList extends StatefulWidget {
  UsrPsychList();
  @override
  _UsrPsychList createState() => _UsrPsychList();
}

class _UsrPsychList extends State<UsrPsychList> {
  // UsrPsychList({this.first_name, this.last_name, this.id})
  @override
  Widget build(BuildContext context) {
    final psychs = Provider.of<List<PsyData>>(context);
    if (psychs == null) {
      return LoadingScreen();
    } else if (psychs == [] || psychs.length == 0) {
      print("Nothing to see here");
      return Center(
        child: Text("No Items to Display"),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: psychs.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {
                debugPrint('${psychs[index].email} is pressed!');
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new PsyProfileUsr(
                          email: psychs[index].email,
                          address: psychs[index].address,
                          firstName: psychs[index].firstName,
                          lastName: psychs[index].lastName,
                          ctype: psychs[index].counsellType,
                          pid: psychs[index].pid,
                          city: psychs[index].city,
                          number: psychs[index].phoneNumber,
                        ));
                Navigator.of(context).push(route);
              },
              title:
                  Text(psychs[index].firstName + " " + psychs[index].lastName),
              leading: Icon(Icons.account_circle),
              trailing: Text(psychs[index].city),
            ));
          });
    }
  }
}
