import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/recordattendance_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
/* import 'package:google_maps_flutter/google_maps_flutter.dart'; */

/* GoogleMapController? mapController;
void _onMapCreated(GoogleMapController controller) {
  //controller.setMapStyle(AppColors.mapStyles);
  mapController = controller;
} */

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordattendanceController>(
      builder: (controller) => Obx(() => FlutterMap(
                mapController: controller.mapController,
                options: MapOptions(
                    enableScrollWheel: false,
                    interactiveFlags:
                        InteractiveFlag.all & ~InteractiveFlag.rotate,
                    center: controller.currentLocation.value,
                    zoom: 20.0,
                    maxZoom: 20.0,
                    minZoom: 0),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}{r}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: controller.currentLocation.value,
                        builder: (ctx) => Container(
                            child: const Icon(
                          Icons.location_on_sharp,
                          size: 50,
                          color: Colors.red,
                        )),
                      ),
                      Marker(
                        point: controller.workPosition,
                        builder: (ctx) => Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset('assets/markerValtx.png'),
                        ),
                      )
                    ],
                  ),
                  CircleLayer(
                    circles: [
                      CircleMarker(
                        point: controller.workPosition,
                        radius: 50.0,
                        color: Colors.transparent,
                        borderColor: AppColors.primary,
                        borderStrokeWidth: 2.0,
                      )
                    ],
                  )
                ],
              )

          /* {
          mapController?.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: controller.currentLocation.value,
                zoom: 18.0,
              ),
            ),
          );
          return ClipRRect(
            child: GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              myLocationEnabled: false,
              indoorViewEnabled: true,
              compassEnabled: false,
              //tiltGesturesEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: controller.currentLocation.value,
                zoom: 18.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('current_location'),
                  position: controller.currentLocation.value,
                ),
                Marker(
                  markerId: const MarkerId("lugarEspecifico"),
                  position: controller.workPosition,
                  infoWindow: const InfoWindow(title: "Trabajo"),
                  icon: controller.iconMap,
                ),
              },
              circles: {
                Circle(
                  circleId: const CircleId("circuloLugarEspecifico"),
                  center: controller.workPosition,
                  radius: 50,
                  fillColor: AppColors.radiusMap,
                  strokeColor: AppColors.primary,
                  strokeWidth: 2,
                ),
              },
            ),
          );
        }, */
          ),
    );
  }
}
