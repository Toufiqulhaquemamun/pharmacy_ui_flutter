
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/services.dart';
import 'package:pharmacy/models/medicine.dart';
import 'package:pharmacy/pages/achievement_page.dart';
import 'package:pharmacy/pages/doc_screen.dart';
import 'package:pharmacy/pages/forgot_password_verification_page.dart';
import 'package:pharmacy/pages/goals_page.dart';
import 'package:pharmacy/pages/location_screen.dart';
import 'package:pharmacy/pages/medicine_screen.dart';
import 'package:pharmacy/pages/settings.dart';
import 'package:pharmacy/pages/widgets/header_widget.dart';

import 'common/theme_helper.dart';



class HomePage extends StatefulWidget{

  const HomePage({Key? key}): super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
  
}

class PieData {
  PieData(this.activity, this.time);
    String activity;
    double time;
    
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin, WidgetsBindingObserver{
  double _headerHeight = 150;
  Key _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  late List<charts.Series<PieData, String>> _pieData;
  List<dynamic> _foundUsers = [];
  List<dynamic> _allUsers = [];
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  // final List _allUsers = medicineData;
  late TabController tabController;

  @override void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);

    _pieData = <charts.Series<PieData, String>>[];
}

//     generateData() {
//         var piedata = [
//             new PieData('Work', 35.8),
//             new PieData('Eat', 8.3),
//             new PieData('Commute', 10.8),
//             new PieData('TV', 15.6),
//             new PieData('Sleep', 19.2),
//             new PieData('Other', 10.3),
//         ];
//     _pieData.add(
//         charts.Series(
//             domainFn: (PieData data, _) => data.activity,
//             measureFn: (PieData data, _) => data.time,
//             id: 'Time spent',
//             data: piedata,
//             labelAccessorFn: (PieData row, _) => '${row.activity}',
//         ),
//     );
//     return _pieData;
// }

     

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Home",
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   elevation: 0.5,
      //   iconTheme:IconThemeData(color: Colors.white),
      //   flexibleSpace:Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
      //         )
      //     ),
      //   ),
      //   actions: [
      //     Container(
      //       margin: EdgeInsets.only( top: 16, right: 16,),
      //       child: Stack(
      //         children: <Widget>[
      //           Icon(Icons.notifications),
      //           Positioned(
      //             right: 0,
      //             child: Container(
      //               padding: EdgeInsets.all(1),
      //               decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
      //               constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
      //               child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
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
      body: _buildTabContent(),
      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       title: Text("Home"),
      //       floating: true,
      //       backgroundColor: Colors.white,
      //       pinned: true,
      //       flexibleSpace:FlexibleSpaceBar(
      //         background: Column(
      //           children: <Widget>[
      //             //     Container(
      //             //   height: _headerHeight,
      //             //   child: HeaderWidget(_headerHeight, true, Icons.medical_services_outlined),
      //             // ),
      //             SizedBox(height: 75.0,),
      //             Padding(
      //               padding:  EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
      //               child: Container(
      //                 height: 40.0,
      //                 width: double.infinity,
      //                 child: CupertinoTextField(
      //                   keyboardType: TextInputType.text,
      //                   placeholder: 'Search your medicine',
      //                   placeholderStyle: TextStyle(
      //                     color: Color(0xffC4C6CC),
      //                     fontSize: 14.0,
      //                     fontFamily: 'Brutal',
      //                   ),
      //                   onSubmitted: (value){
      //                     _runFilter(value);
      //                   },
      //                   prefix: Padding(
      //                     padding:
      //                     const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
      //                     child: Icon(
      //                       Icons.search,
      //                       color: Color(0xffC4C6CC),
      //                     ),
      //                   ),
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(8.0),
      //                     color: Color(0xffF0F1F5),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       expandedHeight: 120.0,
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //             (context, index) =>
      //            InkWell(
      //              onTap: (){
      //               showDialogWithFields(context, _foundUsers[index]);
      //              },
      //              child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Card(
      //              color: Color(0xffC4C6CC),
      //              elevation: 8,
      //              margin: const EdgeInsets.symmetric(vertical: 5),
      //              child: ListTile(
      //                leading: CircleAvatar(
      //                  backgroundColor: Colors.white,
      //                  radius: 28,
      //                  backgroundImage: NetworkImage(medicineData[index].image),
      //                ),
      //                title: Text(_foundUsers[index].name),
      //                subtitle: Text(
      //                    '${_foundUsers[index].producePharma.toString()} '),
      //                trailing: Text(_foundUsers[index].mediType),
      //                isThreeLine: true,
      //              ),
      //          ),
      //         ),
      //            ),
      //         // Builds 1000 ListTiles
      //         childCount:  _foundUsers.length,
      //       ),
      //       // delegate: SliverChildListDelegate(
      //       //   [
      //       //    SizedBox(
      //       //      height: 500.0,
      //       //      child: _foundUsers.isNotEmpty?
      //       //      ListView.builder(
      //       //        itemCount: _foundUsers.length,
      //       //        itemBuilder: (context, index) =>
      //       //            InkWell(
      //       //              onTap: (){},
      //       //              child: Card(
      //       //                // key: ValueKey(_foundUsers[index]["name"]),
      //       //                color: Color(0xffC4C6CC),
      //       //                elevation: 4,
      //       //                margin: const EdgeInsets.symmetric(vertical: 5),
      //       //                child: ListTile(
      //       //                  leading: CircleAvatar(
      //       //                    backgroundColor: Colors.white,
      //       //                    radius: 28,
      //       //                    backgroundImage: NetworkImage(medicineData[index].image),
      //       //                  ),
      //       //                  title: Text(_foundUsers[index].name),
      //       //                  subtitle: Text(
      //       //                      '${_foundUsers[index].producePharma.toString()} '),
      //       //                  trailing: Text(_foundUsers[index].mediType),
      //       //                  isThreeLine: true,
      //       //                ),
      //       //              ),
      //       //            ),
      //       //      ):
      //       //      Center(
      //       //        child: const Text(
      //       //          'No results found',
      //       //          style: TextStyle(fontSize: 24),
      //       //        ),
      //       //      ),
      //       //    )
      //       //
      //       //   ]
      //       // ),
      //     ),
      //   ],
      //   // Column(
      //   //   children: [
      //   //     Container(
      //   //       height: _headerHeight,
      //   //       child: HeaderWidget(_headerHeight, true, Icons.medical_services_outlined),
      //   //     ),
      //   //     SafeArea(
      //   //       child: Container(
      //   //         padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      //   //           margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
      //   //         child: Column(
      //   //           children: [
      //   //             Text(
      //   //               'Homepage',
      //   //               style: TextStyle(fontSize: 40,color: Colors.indigoAccent , fontWeight: FontWeight.bold),
      //   //             ),
      //   //             Text(
      //   //               '',
      //   //               style: TextStyle(color: Colors.grey),
      //   //             ),
      //   //             SizedBox(height: 0.0),
      //   //             Form(
      //   //               key: _formKey,
      //   //                 child: Column(
      //   //                   children: [
      //   //                     Container(
      //   //                       child: TextField(
      //   //                         onChanged: (value) => _runFilter(value),
      //   //                         decoration: ThemeHelper().textInputDecoration('search medicine'),
      //   //                       ),
      //   //                       decoration: ThemeHelper().inputBoxDecorationShaddow(),
      //   //                     ),
      //   //                     SizedBox(height: 20.0),
      //   //                     SizedBox(height: 15.0),
      //   //                   ]
      //   //                 ),
      //   //             ),
      //   //
      //   //           ]
      //   //         ),
      //   //       ),
      //   //     ),
      //   //      Container(
      //   //        height: 350.0,
      //   //        child: _foundUsers.isNotEmpty
      //   //            ? ListView.builder(
      //   //          itemCount: _foundUsers.length,
      //   //          itemBuilder: (context, index) =>
      //   //          Card(
      //   //            // key: ValueKey(_foundUsers[index]["name"]),
      //   //            color: Colors.amberAccent,
      //   //            elevation: 4,
      //   //            margin: const EdgeInsets.symmetric(vertical: 5),
      //   //            child: ListTile(
      //   //              leading: CircleAvatar(
      //   //                backgroundColor: Colors.white,
      //   //                radius: 28,
      //   //                backgroundImage: NetworkImage(medicineData[index].image),
      //   //              ),
      //   //              title: Text(_foundUsers[index].name),
      //   //              subtitle: Text(
      //   //                  '${_foundUsers[index].producePharma.toString()} '),
      //   //              trailing: Text(_foundUsers[index].mediType),
      //   //              isThreeLine: true,
      //   //            ),
      //   //          ),
      //   //        )
      //   //            : const Text(
      //   //          'No results found',
      //   //          style: TextStyle(fontSize: 24),
      //   //        ),
      //   //      )
      //   //
      //   //
      //   //   ]
      //   // ),
      // ),
      bottomNavigationBar:
      _buildTabs()
      // BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.white,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.badge_rounded),
      //       label: 'Resources',
      //       backgroundColor: Colors.white,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.local_hospital),
      //       label: 'Hospitals',
      //       backgroundColor: Colors.white,
      //     ),
      //
      //   ],
      //   currentIndex: _selectedIndex,
      //   unselectedItemColor: Colors.black,
      //   selectedItemColor: Colors.blue,
      // ),
      
    );
  }
  Widget _buildTabContent() {
    return TabBarView(
      controller: tabController,
      children: [
        MedicineScreen(),
        DocumentScreen(),
        LocationScreen(),

      ],
    );
  }
  Widget _buildTabs() {
    return Container(
      color: Colors.white10,
      child: Tabs(tabController),
    );
  }

}

class Tabs extends StatefulWidget {
  final TabController tabController;
  Tabs(this.tabController);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    widget.tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(

      fontWeight: FontWeight.w600,
    );

    BottomNavigationBarItem _buildTabBarItem(String label, IconData icon, IconData activeIcon) {
      return BottomNavigationBarItem(
        icon: Icon(icon),
        activeIcon: Icon(activeIcon, size: 35),
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(label, style: labelStyle),
        ),
      );
    }

    return CupertinoTabBar(
      items: [
        _buildTabBarItem('Home', CupertinoIcons.home, CupertinoIcons.home),
        _buildTabBarItem('Resources', CupertinoIcons.doc_checkmark, CupertinoIcons.doc_checkmark_fill),
        _buildTabBarItem('Doctors', CupertinoIcons.person, CupertinoIcons.person_solid),
      ],
      onTap: onTap,
      currentIndex: currentIndex,
      activeColor: Theme.of(context).accentColor,
      // inactiveColor: Colors.white.withOpacity(0.7),
      backgroundColor: Colors.white,
    );
  }
}

