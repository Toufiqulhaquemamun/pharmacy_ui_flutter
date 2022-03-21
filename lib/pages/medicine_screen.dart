


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy/models/medicine.dart';
import 'package:pharmacy/pages/widgets/header_widget.dart';

import '../home_page.dart';

class MedicineScreen extends StatefulWidget{

  const MedicineScreen({Key? key}): super(key:key);

  @override
  _MediScreenState createState() => _MediScreenState();

}

class _MediScreenState extends State<MedicineScreen>{

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  List<dynamic> _foundUsers = [];
  List<dynamic> _allUsers = [];

@override
  void initState() {
  _allUsers = medicineData;
  debugPrint(_allUsers.length.toString());
  _foundUsers = _allUsers;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
            color: Colors.white,

          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("Mr/Mrs xxxxx",
                    style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.screen_lock_landscape_rounded, size: _drawerIconSize, color: Colors.black,),
                title: Text('Home Page', style: TextStyle(fontSize: 17, color: Colors.black),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.login_rounded,size: _drawerIconSize,color: Colors.black),
              //   title: Text('Your Goals', style: TextStyle(fontSize: _drawerFontSize, color: Colors.black),
              //   ),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Goal()),);
              //   },
              // ),
              // //Divider(color: Theme.of(context).primaryColor, height: 1,),
              // ListTile(
              //   leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,color: Colors.black),
              //   title: Text('Settings ',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()),);
              //   },
              // ),
              // //Divider(color: Theme.of(context).primaryColor, height: 1,),
              // ListTile(
              //   leading: Icon(Icons.password_rounded, size: _drawerIconSize,color: Colors.black,),
              //   title: Text('Achievement page',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
              //   onTap: () {
              //     Navigator.push( context, MaterialPageRoute(builder: (context) => CardDesign()),);
              //   },
              // ),
              // //Divider(color: Theme.of(context).primaryColor, height: 1,),
              // ListTile(
              //   leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,color: Colors.black,),
              //   title: Text('Verification Page',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
              //   onTap: () {
              //     Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordVerificationPage()), );
              //   },
              // ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Colors.black,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ) ,
      body:
      CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Home"),
            floating: true,
            backgroundColor: Colors.white,
            pinned: true,
            flexibleSpace:FlexibleSpaceBar(
              background: Column(
                children: <Widget>[
                  //     Container(
                  //   height: _headerHeight,
                  //   child: HeaderWidget(_headerHeight, true, Icons.medical_services_outlined),
                  // ),
                  SizedBox(height: 75.0,),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        placeholder: 'Search your medicine',
                        placeholderStyle: TextStyle(
                          color: Color(0xffC4C6CC),
                          fontSize: 14.0,
                          fontFamily: 'Brutal',
                        ),
                        onSubmitted: (value){
                          _runFilter(value);
                        },
                        prefix: Padding(
                          padding:
                          const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xffC4C6CC),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xffF0F1F5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            expandedHeight: 120.0,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                 InkWell(
                   onTap: (){
                    showDialogWithFields(context, _foundUsers[index]);
                   },
                   child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                   color: Color(0xffe5e6e8),
                   elevation: 8,
                   margin: const EdgeInsets.symmetric(vertical: 5),
                   child: ListTile(
                     leading: CircleAvatar(
                       backgroundColor: Colors.white,
                       radius: 28,
                       backgroundImage: NetworkImage(medicineData[index].image),
                     ),
                     title: Text(_foundUsers[index].name),
                     subtitle: Text(
                         '${_foundUsers[index].producePharma.toString()} '),
                     trailing: Text(_foundUsers[index].mediType),
                     isThreeLine: true,
                   ),
               ),
              ),
                 ),
              // Builds 1000 ListTiles
              childCount:  _foundUsers.length,
            ),
            // delegate: SliverChildListDelegate(
            //   [
            //    SizedBox(
            //      height: 500.0,
            //      child: _foundUsers.isNotEmpty?
            //      ListView.builder(
            //        itemCount: _foundUsers.length,
            //        itemBuilder: (context, index) =>
            //            InkWell(
            //              onTap: (){},
            //              child: Card(
            //                // key: ValueKey(_foundUsers[index]["name"]),
            //                color: Color(0xffC4C6CC),
            //                elevation: 4,
            //                margin: const EdgeInsets.symmetric(vertical: 5),
            //                child: ListTile(
            //                  leading: CircleAvatar(
            //                    backgroundColor: Colors.white,
            //                    radius: 28,
            //                    backgroundImage: NetworkImage(medicineData[index].image),
            //                  ),
            //                  title: Text(_foundUsers[index].name),
            //                  subtitle: Text(
            //                      '${_foundUsers[index].producePharma.toString()} '),
            //                  trailing: Text(_foundUsers[index].mediType),
            //                  isThreeLine: true,
            //                ),
            //              ),
            //            ),
            //      ):
            //      Center(
            //        child: const Text(
            //          'No results found',
            //          style: TextStyle(fontSize: 24),
            //        ),
            //      ),
            //    )
            //
            //   ]
            // ),
          ),
        ],
        // Column(
        //   children: [
        //     Container(
        //       height: _headerHeight,
        //       child: HeaderWidget(_headerHeight, true, Icons.medical_services_outlined),
        //     ),
        //     SafeArea(
        //       child: Container(
        //         padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        //           margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
        //         child: Column(
        //           children: [
        //             Text(
        //               'Homepage',
        //               style: TextStyle(fontSize: 40,color: Colors.indigoAccent , fontWeight: FontWeight.bold),
        //             ),
        //             Text(
        //               '',
        //               style: TextStyle(color: Colors.grey),
        //             ),
        //             SizedBox(height: 0.0),
        //             Form(
        //               key: _formKey,
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       child: TextField(
        //                         onChanged: (value) => _runFilter(value),
        //                         decoration: ThemeHelper().textInputDecoration('search medicine'),
        //                       ),
        //                       decoration: ThemeHelper().inputBoxDecorationShaddow(),
        //                     ),
        //                     SizedBox(height: 20.0),
        //                     SizedBox(height: 15.0),
        //                   ]
        //                 ),
        //             ),
        //
        //           ]
        //         ),
        //       ),
        //     ),
        //      Container(
        //        height: 350.0,
        //        child: _foundUsers.isNotEmpty
        //            ? ListView.builder(
        //          itemCount: _foundUsers.length,
        //          itemBuilder: (context, index) =>
        //          Card(
        //            // key: ValueKey(_foundUsers[index]["name"]),
        //            color: Colors.amberAccent,
        //            elevation: 4,
        //            margin: const EdgeInsets.symmetric(vertical: 5),
        //            child: ListTile(
        //              leading: CircleAvatar(
        //                backgroundColor: Colors.white,
        //                radius: 28,
        //                backgroundImage: NetworkImage(medicineData[index].image),
        //              ),
        //              title: Text(_foundUsers[index].name),
        //              subtitle: Text(
        //                  '${_foundUsers[index].producePharma.toString()} '),
        //              trailing: Text(_foundUsers[index].mediType),
        //              isThreeLine: true,
        //            ),
        //          ),
        //        )
        //            : const Text(
        //          'No results found',
        //          style: TextStyle(fontSize: 24),
        //        ),
        //      )
        //
        //
        //   ]
        // ),
      ),
    );
  }

  Future<Object?> showDialogWithFields(BuildContext context,Medicine prod) {

    // controller.addOns(int.parse(prod.prodId.toString()));
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.arrow_back),
          ),
          body:SingleChildScrollView(
            child: Stack(
              children: [
                Container(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),),
                Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.white),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 100, offset: const Offset(5, 5),),
                          ],
                        ),
                        child: Image.network(prod.image),
                      ),
                      SizedBox(height: 20,),
                      Text(prod.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(prod.mediType, ),
                      SizedBox(height: 10,),
                      Text("Generic: "+prod.genericName,),
                      SizedBox(height: 10,),
                      Text(prod.producePharma,),
                      SizedBox(height: 10,),

                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: ''),
                                    WidgetSpan(child: Icon(Icons.sd_card_alert_outlined)),
                                    TextSpan(text: 'Safety Advice',style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Row(children: [
                              Expanded(child: Text("Alcohol"),flex: 2,),
                              Expanded(child: Text("It is unsafe to consume alcohol with Napa 500."),flex: 4,)
                            ],),
                            SizedBox(height: 5.0),
                            Row(children: [
                              Expanded(child: Text("Prgnancy"),flex: 2,),
                              Expanded(child: Text("Napa 500 is safe to use during pregnancy. Most studies have shown low or no risk to the developing baby"),flex: 4,)
                            ],),
                            SizedBox(height: 5.0),
                            Row(children: [
                              Expanded(child: Text("Driving"),flex: 2,),
                              Expanded(child: Text("Napa 500 does not usually affect your ability to drive."),flex: 4,)
                            ],),
                            SizedBox(height: 5.0),
                            Row(children: [
                              Expanded(child: Text("Kidney"),flex: 2,),
                              Expanded(child: Text("Napa 500 should be used with caution in patients with kidney disease. Dose adjustment of Napa 500 may be needed. Please consult your doctor."),flex: 4,)
                            ],)

                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: ''),
                                    WidgetSpan(child: Icon(Icons.book_outlined)),
                                    TextSpan(text: 'Medicine Info',style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'Introduction',style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              child: Text("Napa 500 is a medicine used to relieve pain and to "
                                  "reduce fever. It is used to treat many conditions such as "
                                  "headache, body ache, toothache and common cold. Napa 500 "
                                  "may be prescribed alone or in combination with another medicine. "
                                  "You should take it regularly as advised by your doctor. "
                                  "It is usually best taken with food otherwise it may upset "
                                  "your stomach. Do not take more or use it for longer than recommended"),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )

      ),
    );


  }
  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
}