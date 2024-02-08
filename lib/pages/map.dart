import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:minsait_larh/styles/styles.dart';
import 'package:minsait_larh/widgets/widgets.dart';

class MapScreen extends StatefulWidget {
  final AsyncSnapshot? data;

  const MapScreen({super.key, this.data});
  static const route = 'Map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  dynamic scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic screen;
  dynamic safePadding;

  String MAPBOX_ACCESS_TOKEN =
      'pk.eyJ1IjoibHVpc3JhbWlyZXpoZHoiLCJhIjoiY2wyM255eHFlMXMzOTNjcDZlcmJucGVyaiJ9.xMocrxa6wklzOx6r3K8Cjg';

  var positions = [
    const LatLng(19.4933167, -99.1985664),
    const LatLng(19.501003053729686, -99.17676540521758),
  ];

  var marker = <Marker>[];

  @override
  void initState() {
    for (var position in positions) {
      marker.add(
        Marker(
            point: position,
            child: const Icon(
              Icons.location_pin,
              color: primary,
              size: 40,
            )),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    safePadding = MediaQuery.of(context).padding;

    return Board(
      title: 'Ubicaciones',
      bottomBar: BottomBar(active: ActiveBottomBarIcon.map),
      body: Stack(
        children: [
          SizedBox(
            height: screen.height,
            width: screen.width,
            child: FlutterMap(
              options: const MapOptions(
                  initialCenter: LatLng(19.501003053729686, -99.17676540521758),
                  zoom: 13),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: {
                    'accessToken': MAPBOX_ACCESS_TOKEN,
                    'id': 'mapbox/streets-v12'
                  },
                ),
                MarkerLayer(
                  markers: marker,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
