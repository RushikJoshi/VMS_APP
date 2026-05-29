import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrence extends StatefulWidget {
  const SharedPrefrence({super.key});

  @override
  State<SharedPrefrence> createState() => _SharedPrefrenceState();
}

class _SharedPrefrenceState extends State<SharedPrefrence> {
// String name='';
// int age=0;
// double height=0;


@override
void initState()  {
    // TODO: implement initState
    super.initState();
    //isLogin();
}
 // void isLogin() async{
 //   SharedPreferences sp=  await SharedPreferences.getInstance();
 //   // name =sp.getString('name') ?? '';
 //   // age = sp.getInt('age') ?? 0;
 //   // height = sp.getDouble('height') ?? 0;
 //   setState(() {
 //
 //   });
 //
 // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Prefrence'),
      ),
      body: Column(
        children: [
          // Text(name.toString()),
          // Text(age.toString()),
          // Text(height.toString()),
          FutureBuilder(
            future:SharedPreferences.getInstance(),
            builder: (context, AsyncSnapshot<SharedPreferences>snapshot) {
              return Column(
                children: [
                  Text(snapshot.data!.getString('name').toString()),
                  Text(snapshot.data!.getDouble('height').toString()),
                  // Text(snapshot.data!.setInt('age').toString()),
                  // Text(snapshot.data!.setBool('login').toString()),

                ],
              );

          },)


        ],
      ),
floatingActionButton: FloatingActionButton(
    onPressed: () async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setInt('age', 24);
     sp.setDouble('height', 5.4);
     sp.setString('name', 'kishan');
     sp.setBool('islogin', false);

     //name =sp.getString('name') ?? '';
     //or========
     //name=sp.getString('string').toString();
     setState(() {

     });

      print(sp.getString('string'));
     print(sp.getInt('age'));
     print(sp.getBool('islogin'));
     print(sp.getDouble('num'));

      },
child: Icon(Icons.add),
),
    );
  }
}

