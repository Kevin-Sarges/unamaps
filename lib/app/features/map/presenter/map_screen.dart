// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unamaps/app/common/utils/markers_maps.dart';
import 'package:unamaps/app/features/map/presenter/controller/map_cubit.dart';
import 'package:unamaps/app/features/map/presenter/controller/map_state.dart';
import 'package:unamaps/app/features/map/presenter/widget/sala_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _cubit = GetIt.I.get<MapCubit>();
  Set<Marker> markers = <Marker>{};

  late GoogleMapController _controllerMap;

  loadLocais() {
    final locais = MarkersMaps().locais;

    locais.forEach((local) async {
      markers.add(
        Marker(
          markerId: MarkerId(local.nomeLocal),
          position: LatLng(
            local.lat,
            local.lon,
          ),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              size: Size(
                5,
                5,
              ),
            ),
            local.marker,
          ),
          infoWindow: InfoWindow(
            title: local.nomeLocal,
            snippet: local.nomeLocal,
          ),
          onTap: () => {
            showModalBottomSheet(
              context: context,
              builder: (context) => SalaWidget(local: local),
            ),
          },
        ),
      );
    });
  }

  void _onCreatedMap(GoogleMapController controller) {
    _controllerMap = controller;
  }

  @override
  void initState() {
    super.initState();

    _cubit.getUserPosition();
    loadLocais();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1º Andar'),
        backgroundColor: const Color.fromRGBO(17, 104, 20, 1),
      ),
      body: BlocBuilder<MapCubit, MapState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is MapLoadgin) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(17, 104, 20, 1),
              ),
            );
          }

          if (state is MapError) {
            return Center(
              child: Text(state.erro.errorMessage),
            );
          }

          if (state is MapSucess) {
            return GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  // -1.4392591,
                  // -48.4782156,
                  state.lat,
                  state.lon,
                ),
                zoom: 19,
              ),
              onMapCreated: _onCreatedMap,
              markers: markers,
            );
          }

          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
