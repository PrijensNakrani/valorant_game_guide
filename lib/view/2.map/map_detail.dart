import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class Map extends StatelessWidget {
  final mapImage;
  const Map({Key? key, this.mapImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return RotatedBox(
      quarterTurns: 1,
      child: Hero(
        tag: '$mapImage',
        child: PinchZoom(
          child: Image.network(
            '${mapImage}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
