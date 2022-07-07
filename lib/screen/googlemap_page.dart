import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

import 'find_listview.dart';

class TestGoogleMap extends StatefulWidget {
  const TestGoogleMap({Key? key}) : super(key: key);

  @override
  State<TestGoogleMap> createState() => _TestGoogleMapState();
}

class _TestGoogleMapState extends State<TestGoogleMap> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Future? _future;

  Future<String> loadString() async =>
      await rootBundle.loadString('lib/model/market_list_data.json');
  List<Marker> allMarkers = [];
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.545193, 126.964668),
    zoom: 15,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = loadString();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              List<dynamic> parsedJson = jsonDecode(snapshot.data);
              allMarkers = parsedJson.map((element) {
                return Marker(
                    markerId: MarkerId(element['place']),
                    position: LatLng(element['Latitude'], element['Longitude']),
                    infoWindow: InfoWindow(
                        title: element['place'],
                        onTap: () {
                          var bottomSheetController = scaffoldKey.currentState!
                              .showBottomSheet((context) => Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 32),
                                          color: Colors.white,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                color: Colors.blueAccent,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        element['place'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Text("4.5",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12)),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(
                                                    Icons.map,
                                                    color: Colors.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(element['address'])
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(
                                                    Icons.call,
                                                    color: Colors.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(element['number'])
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: FloatingActionButton(
                                                child:
                                                    Icon(Icons.person_search),
                                                onPressed: () {
                                                  Get.to(
                                                      () => FindListviewPage());
                                                }),
                                          ),
                                        )
                                      ],
                                    ),
                                    height: 250,
                                    color: Colors.transparent,
                                  ));
                        },
                        snippet: element['address']));
              }).toList();

              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set.from(allMarkers),
              );
            },
          ),
        ),
      ]),
    );
  }
}
