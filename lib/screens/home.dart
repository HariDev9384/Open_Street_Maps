import 'dart:async';

import 'package:auto_reload/auto_reload.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:map_ui/models/API_Model.dart';
import 'package:map_ui/services/OSM_Api.dart';
class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
 
  DateTime currenttime=DateTime.now();

  MapController controller = MapController(
                            initMapWithUserPosition: true,
                            
                            initPosition: GeoPoint(latitude: 11.0894733, longitude: 76.9886883       
                            ),     
                            
                            
                                              );

  @override
  void mapZoomIn(){
    controller.zoomIn();
  }
  void mapZoomout(){
    controller.zoomOut();
  }
  void current_location(){
    controller.currentLocation();
    
  }
  Future<API_Model>? future;
  void refresh(){
    setState(() {
      future=OSM_Api().FetchData();
      Future.delayed(Duration(seconds: 5),()async{
      await controller.changeLocation(GeoPoint(latitude: 11.0894733, longitude: 76.9886883));
      Future.delayed(Duration(seconds: 5), () async {
      await controller.zoomIn();
    });
    });
    });
     
  }
  void initState() {
  super.initState();
  var isinit=false; 
  if(isinit==false){
    controller = MapController(
      initMapWithUserPosition: true,
      initPosition: GeoPoint(
        latitude: 11.0894733,
        longitude:  76.9886883,
      ),
    );
   
    setState(() {
       future=OSM_Api().FetchData();
       
    });
    Future.delayed(Duration(seconds: 5),()async{
      await controller.changeLocation(GeoPoint(latitude: 11.0894733, longitude: 76.9886883));
      
    });
    Future.delayed(Duration(seconds: 5), () async {
      await controller.zoomIn();
    });
    setState(() {
      isinit=true;
    });
  }
  Timer.periodic(Duration(seconds: 10), (timer) {
    refresh();
   });
  }                            

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: Colors.redAccent,
      child: FutureBuilder<API_Model>(
        future: future,
        builder: (context,AsyncSnapshot<API_Model> snapshot) {
          if(snapshot.hasData){
          String? timestamp=snapshot.data?.timestamp.toString();
          DateTime dt = DateTime.parse(timestamp!);
          double? odd= double.parse(snapshot.data!.totalOdometer);
      return
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text('Live\n Updated Time: ${snapshot.data!.lastUpdated.substring(7,15)}'),
              leading: Icon(FontAwesomeIcons.arrowLeft),
            ),
            body: Container(
              height:MediaQuery.of(context).size.height/1,
              width: MediaQuery.of(context).size.width/1,
              margin: EdgeInsets.all(3),
              child: Stack(
                children: 
                  [
                    OSMFlutter(
                    controller: controller,
                    trackMyPosition: false,
                    initZoom: 12,
                    
                    minZoomLevel: 2,
                    maxZoomLevel: 12,
                    showZoomController: true,
                    androidHotReloadSupport: true,
                    // stepZoom: 1.0,
                    userLocationMarker: UserLocationMaker(
                        personMarker: MarkerIcon(
                            icon: Icon(
                                Icons.my_location,
                                color: Colors.red,
                                size: 48,
                            ),
                        ),
                        directionArrowMarker: MarkerIcon(
                            icon: Icon(
                                Icons.car_crash,
                                color: Colors.green,
                                size: 48,
                
                            ),
                        ),
                    ),
                    markerOption: MarkerOption(
                        defaultMarker: MarkerIcon(      
                            icon: Icon(
                              FontAwesomeIcons.carAlt,
                              color: Colors.black,
                              size: 56,
                              ),
                            )
                    ),
                              ),
                              Positioned(
                      right: 5,
                      top: 120,
                      child: Card(
                        elevation: 10,
                      child: InkWell(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Image.asset('images/mountain.png',
                          fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )),
                    Positioned(
                      right: 5,
                      top: 200,
                      child: Card(
                        elevation: 10,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            refresh();
                          });
                          
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(Icons.refresh),
                        ),
                      ),
                    )),
                
                    Positioned(
                      right: 5,
                      top: 270,
                      child: Card(
                        elevation: 10,
                      child: InkWell(
                        
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(Icons.settings),
                        ),
                      ),
                    )),
                    Positioned(
                      
                      bottom:130,
                      right: 10,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            InkWell(
                
                              onTap: (){
                                mapZoomIn();
                                print(snapshot.data!.altitude);
                                
                              },
                              child: Container(
                                height: 50,
                                
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )
                                ),
                                width: 50,
                                child: Center(child:Icon(Icons.add)),
                              ),
                              ),InkWell(
                                onTap: (){
                                  mapZoomout();
                                },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                  )
                                ),
                                width: 50,
                                child: Center(child: Icon(Icons.minimize)),
                              ),
                              ),
                          ],
                        ),
                      ),
                    ),          
                    Positioned(
                      bottom: 5,
                      
                      child: Card(
                        elevation: 10,
                        color: Colors.transparent,
                        child: Container(
                          height: 120,
                          width: 345,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Row( mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 110,
                                color: Colors.transparent,
                                width: 80,
                                child: Image.asset('images/car.png'),
                              ),
                              Container(
                                 margin: EdgeInsets.only(left: 5),
                                  height: 110,
                                  width: 250,
                                color: Colors.transparent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text('KIO SALTOS',
                                        style: TextStyle(
                                          fontSize: 24
                                        ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('SUV',
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('peelamedu')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Parked : ${currenttime.difference(dt).inHours} hrs from ${dt.toString().substring(0,19)}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),
                                        )
                                      ],
                                    ),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(FontAwesomeIcons.key,
                                        color: (snapshot.data!.ignition=="0")?Colors.grey:Colors.green,
                                        ),
                                        Icon(FontAwesomeIcons.plug,
                                        color: (snapshot.data!.unplug=="1")?Colors.red:Colors.green,
                                        ),
                                        Icon(FontAwesomeIcons.directions),
                                        Text('${(odd/0.001).ceil().toString()} km'),
                                        Icon(FontAwesomeIcons.calendar),
                                        Text('79 Km'),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
}else if(snapshot.hasError){
          return Container(
            height: MediaQuery.of(context).size.height/1,
            width: MediaQuery.of(context).size.width/1,
            color: Colors.white,
            child: Center(
              child: Container(
                 height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/1,
                child: Center(
                  child: Text('No Internet Connection',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'regular',
                    decorationColor: Colors.white
                  ),
                  ),
                ),
              ),
            ),
          );
      }else{
        return Container(
          height: MediaQuery.of(context).size.height/1,
          width: MediaQuery.of(context).size.width/1,
          color: Colors.white,
          child: Center(
            child:Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
        }
      ),
    );
  }
}