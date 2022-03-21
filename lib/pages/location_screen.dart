


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmacy/core/services/values.dart';
import 'package:pharmacy/models/markers.dart';
import 'package:pharmacy/models/medicine.dart';
import 'package:pharmacy/pages/widgets/header_widget.dart';

class LocationScreen extends StatefulWidget{

  const LocationScreen({Key? key}): super(key:key);

  @override
  _LocScreenState createState() => _LocScreenState();

}

class _LocScreenState extends State<LocationScreen>{

  late GoogleMapController mapController  ;


  late bool serviceEnabled;
  LatLng initPosition = LatLng(0, 0); //initial Position cannot assign null values
  LatLng currentLatLng= LatLng(0.0, 0.0); //initial currentPosition values cannot assign null values
  LocationPermission permission = LocationPermission.denied; //initial permission status
  Completer<GoogleMapController> _controller = Completer();

  late Position _currentPosition;
  Set<Marker> markers = {};
  final  List<Marker> markerList = <Marker>[];



  CameraPosition cameraPosition =  CameraPosition(
    target: LatLng(LATITUDE, LONGITUDE),
    zoom: 12.0,
  );
  bool isLoading = true;
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        LATITUDE = position.latitude;
        LONGITUDE = position.longitude;
        currentLatLng = LatLng(position.latitude,position.longitude);
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 12.0,
            ),
          ),
        );

      });

    }).catchError((e) {
      print(e);
    });
  }


  void getMarker() {
    markerListData.forEach((element) {
      // print(element.startLoc);
      markerList.add(Marker(markerId: MarkerId(element.id.toString()),
        position: LatLng(double.parse(element.locationLat.toString()),double.parse(element.locationLon.toString())),
        infoWindow: InfoWindow(title: 'name:'+element.name.toString()+', address' +element.desc.toString()),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),));
    });
    setState(() {
      isLoading =false;
    });
  }


@override
  void initState() {
  _getCurrentLocation();
  getMarker();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Container(
          height: height,
          width: width,
          child:
          isLoading? const Center(
              child: CupertinoActivityIndicator()) :
          Scaffold(
            // key: _scaffoldKey,
            body: Stack(
              children: <Widget>[
                // Map View
                GoogleMap(
                  markers: Set<Marker>.from(markerList),
                  initialCameraPosition: cameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,

                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  onCameraMove: (cameraPosition){
                    this.cameraPosition = cameraPosition;
                  },
                ),
                // Show zoom buttons
                // Show the place input fields & button for
                // showing the route
                SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Hospitals',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: width * 0.8,
                                child: TextField(
                                  readOnly: false,
                                  onTap: () {

                                  },
                                  onChanged: (value) {
                                    // locationCallback(value);
                                  },
                                  // controller: startAddressController,
                                  // focusNode: focusNode,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.looks_one),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.my_location),
                                      onPressed: () {
                                        mapController.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                              target: LatLng(
                                                currentLatLng.latitude,
                                                currentLatLng.longitude,
                                              ),
                                              zoom: 12.0,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    labelText: "Search",
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.blue.shade300,
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: 'Search here',
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              // Container(
                              //   width: width * 0.8,
                              //   child: TextField(
                              //     readOnly: true,
                              //     onChanged: (value) {
                              //       // locationCallback(value);
                              //     },
                              //     onTap: () {
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(
                              //       //     builder: (context) =>
                              //       //         GMapPage(
                              //       //           onPlacePicked: (result) {
                              //       //             newRouteController.endCoordinates
                              //       //                 .value = result;
                              //       //             print(result);
                              //       //             Navigator.of(context).pop();
                              //       //           },
                              //       //           locationCallback: (value) {
                              //       //             print(value);
                              //       //             newRouteController
                              //       //                 .endPlaceController.value.text =
                              //       //                 value;
                              //       //           },
                              //       //           initialPosition: _coor,
                              //       //         ),
                              //       //   ),
                              //       // );
                              //     },
                              //     // controller: destinationAddressController,
                              //     // focusNode: focusNode,
                              //     decoration: InputDecoration(
                              //       prefixIcon: Icon(Icons.looks_two),
                              //       // suffixIcon: IconButton(
                              //       //   icon: Icon(Icons.my_location),
                              //       //   onPressed: () {
                              //       //     // startAddressController.text = _currentAddress;
                              //       //     // _startAddress = _currentAddress;
                              //       //   },
                              //       // ),
                              //       labelText: "Destination",
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       enabledBorder: OutlineInputBorder(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(10.0),
                              //         ),
                              //         borderSide: BorderSide(
                              //           color: Colors.grey.shade400,
                              //           width: 2,
                              //         ),
                              //       ),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(10.0),
                              //         ),
                              //         borderSide: BorderSide(
                              //           color: Colors.blue.shade300,
                              //           width: 2,
                              //         ),
                              //       ),
                              //       contentPadding: EdgeInsets.all(15),
                              //       hintText: 'Choose destination',
                              //     ),
                              //   ),
                              // ),

                              SizedBox(height: 10),
                              // Visibility(
                              //   visible: _placeDistance == 0 ? false : true,
                              //   child: Text(
                              //     'DISTANCE: $_placeDistance  km',
                              //     style: TextStyle(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 5),
                              ElevatedButton(
                                // onPressed: (_startAddress != '' &&
                                //     _destinationAddress != '')
                                //     ? () async {
                                //   startAddressFocusNode.unfocus();
                                //   desrinationAddressFocusNode.unfocus();
                                //   setState(() {
                                //     if (markers.isNotEmpty) markers.clear();
                                //     if (polylines.isNotEmpty)
                                //       polylines.clear();
                                //     if (polylineCoordinates.isNotEmpty)
                                //       polylineCoordinates.clear();
                                //     _placeDistance = null;
                                //   });
                                //
                                //   _calculateDistance().then((isCalculated) {
                                //     if (isCalculated) {
                                //       ScaffoldMessenger.of(context)
                                //           .showSnackBar(
                                //         SnackBar(
                                //           content: Text(
                                //               'Distance Calculated Sucessfully'),
                                //         ),
                                //       );
                                //     } else {
                                //       ScaffoldMessenger.of(context)
                                //           .showSnackBar(
                                //         SnackBar(
                                //           content: Text(
                                //               'Error Calculating Distance'),
                                //         ),
                                //       );
                                //     }
                                //   });
                                // }
                                //     : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Search'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  // mapController.animateCamera(CameraUpdate.newLatLng(LatLng(locations.first.latitude,locations.first.longitude)));
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 1),
                                        backgroundColor: Colors.red,
                                        content: Text('Searching....'),
                                      ),
                                    );

                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Show current location button
                // SafeArea(
                //   child: Align(
                //     alignment: Alignment.bottomRight,
                //     child: Padding(
                //       padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                //       child: ClipOval(
                //         child: Material(
                //           color: Colors.orange.shade100, // button color
                //           child: InkWell(
                //             splashColor: Colors.orange, // inkwell color
                //             child: SizedBox(
                //               width: 56,
                //               height: 56,
                //               child: Icon(Icons.my_location),
                //             ),
                //             onTap: () {
                //               // mapController.animateCamera(
                //               //   CameraUpdate.newCameraPosition(
                //               //     CameraPosition(
                //               //       target: LatLng(
                //               //         _currentPosition.latitude,
                //               //         _currentPosition.longitude,
                //               //       ),
                //               //       zoom: 18.0,
                //               //     ),
                //               //   ),
                //               // );
                //             },
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          )
      )

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


}