import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_default_gateway/wifi_default_gateway.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _gatewayIP = "Unknown";

  @override
  initState() {
    super.initState();

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String gatewayIP;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      gatewayIP = await WifiDefaultGateway.gatewayIP;
    } on PlatformException {
      gatewayIP = 'Failed to get gateway IP.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted)
      return;

    setState(() {
      _gatewayIP = gatewayIP;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Default Gateway: $_gatewayIP'),
            ],
          )
        ),
      ),
    );
  }
}
