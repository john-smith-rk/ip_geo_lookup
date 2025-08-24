import 'package:flutter/material.dart';
import 'package:ip_geo_lookup/ip_geo_lookup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IPInfo? mData;
  bool isLoading = false;

  Future<void> getData() async {
    setState(() {isLoading=true;});
    mData =  await IPGeoLookupUtility.getIPInfo();
    if(mData != null){
      print(mData);
    }
    setState(() {isLoading=false;});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              ElevatedButton(onPressed: getData, child: Text("Get")),
              isLoading?CircularProgressIndicator():buildIPInfo(),

            ],
          ),
        ),
      )
    );
  }

  Widget buildIPInfo(){
    if(mData == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("IP"),
              Text(" : "),
              Expanded(child: Text(mData!.ip.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Type"),
              Text(" : "),
              Expanded(child: Text(mData!.type.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Continent"),
              Text(" : "),
              Expanded(child: Text(mData!.continent.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("ContinentCode"),
              Text(" : "),
              Expanded(child: Text(mData!.continentCode.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Country"),
              Text(" : "),
              Expanded(child: Text(mData!.country.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("CountryCode"),
              Text(" : "),
              Expanded(child: Text(mData!.countryCode.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Region"),
              Text(" : "),
              Expanded(child: Text(mData!.region.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("RegionCode"),
              Text(" : "),
              Expanded(child: Text(mData!.regionCode.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Latitude"),
              Text(" : "),
              Expanded(child: Text(mData!.latitude.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Longitude"),
              Text(" : "),
              Expanded(child: Text(mData!.longitude.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Postal"),
              Text(" : "),
              Expanded(child: Text(mData!.postal.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("CallingCode"),
              Text(" : "),
              Expanded(child: Text(mData!.callingCode.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Capital"),
              Text(" : "),
              Expanded(child: Text(mData!.postal.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Borders"),
              Text(" : "),
              Expanded(child: Text(mData!.borders?.join(",").toString()??"", style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Connection"),
              Text(" : "),
              Expanded(child: Text(mData!.connection!.domain.toString()+"\n"+mData!.connection!.org.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Timezone"),
              Text(" : "),
              Expanded(child: Text(mData!.timezone!.currentTime.toString()+"\n"+mData!.timezone!.id.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),


        ],
      ),
    );
  }
}
