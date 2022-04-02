import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive_tea/Providers/google_sign_in.dart';
import 'package:rive_tea/Widgets/button.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final Stream<LocationData> locChangeFunc = (() {
    late final StreamController<LocationData> controller;
    controller = StreamController<LocationData>(
      onListen: () async {
        Location location = Location();
        late bool _serviceEnabled;
        late PermissionStatus _permissionGranted;
        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            return;
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            return;
          }
        }
        controller.add(await location.getLocation());
      },
    );
    return controller.stream;
  })();

  Map<String, dynamic> getData(snapshot, curruser) {
    Map<String, dynamic> map;
    map = {
      "caption": "Sample caption \u4545 123!!",
      "chatroomid": curruser.email,
      "downvote": 0,
      "upvote": 0,
      "link": "http://www.google.com",
      "location": {
        "latitude": snapshot.data.latitude,
        "longitude": snapshot.data.longitude
      },
      "userid": curruser.email,
    };
    return map;
  }

  bool postData(snapshot, curruser) {
    try {
      Map<String, dynamic> map = getData(snapshot, curruser);
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('post-data');
      collRef.add(map);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Widget build(context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: StreamBuilder<LocationData>(
            stream: locChangeFunc,
            builder:
                (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
              List<Widget> children = [];
              if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Stack trace: ${snapshot.stackTrace}'),
                  ),
                ];
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    children = const <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Select a lot'),
                      )
                    ];
                    break;
                  case ConnectionState.waiting:
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting location access...'),
                      )
                    ];
                    break;
                  case ConnectionState.active:
                    children = <Widget>[
                      const Text(
                        "Profile",
                      ),
                      Text(
                        'Welcome ' + user.displayName!,
                      ),
                      Text(
                        'Email: ' + user.email!,
                      ),
                      Text(
                        '${snapshot.data?.latitude} ${snapshot.data?.longitude}',
                      ),
                      Button(
                        () {
                          print(
                              "===================| Upload data |=====================");
                          postData(snapshot, FirebaseAuth.instance.currentUser);
                        },
                      ),
                      Button(
                        () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.logout();
                        },
                      )
                    ];
                    break;
                  default:
                    break;
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }
}
