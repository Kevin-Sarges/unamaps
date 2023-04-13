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
  final locais = MarkersMaps().locais;
  Set<Marker> markers = <Marker>{};

  late GoogleMapController _controllerMap;

  void loadLocais() {
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

  void filterLocal(String tipoLocal) async {
    final filter =
        locais.where((local) => local.tipoLocal == tipoLocal).toList();

    for (var local in filter) {
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
    }
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
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(17, 104, 20, 1),
              ),
              child: Text(
                'Escolha um local',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  markers.clear();
                  loadLocais();
                });
                Navigator.pop(context);
                Builder(
                  builder: (context) {
                    Scaffold.of(context).closeEndDrawer();
                    return const SizedBox.shrink();
                  },
                );
              },
              title: const Text('Todos'),
              leading: const Icon(Icons.add_location),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  markers.clear();
                  filterLocal('Banheiros');
                });
                Navigator.pop(context);
                Builder(
                  builder: (context) {
                    Scaffold.of(context).closeEndDrawer();
                    return const SizedBox.shrink();
                  },
                );
              },
              title: const Text('Banheiros'),
              leading: const Icon(Icons.accessibility),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  markers.clear();
                  filterLocal('Lab');
                });
                Navigator.pop(context);
                Builder(
                  builder: (context) {
                    Scaffold.of(context).closeEndDrawer();
                    return const SizedBox.shrink();
                  },
                );
              },
              title: const Text('Labs'),
              leading: const Icon(Icons.school),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  markers.clear();
                  filterLocal('Elevador');
                });
                Navigator.pop(context);
                Builder(
                  builder: (context) {
                    Scaffold.of(context).closeEndDrawer();
                    return const SizedBox.shrink();
                  },
                );
              },
              title: const Text('Elevador'),
              leading: const Icon(Icons.elevator),
            ),
            const SizedBox(width: 5),
            ListTile(
              onTap: () {
                setState(() {
                  markers.clear();
                  filterLocal('Clínica');
                });
                Navigator.pop(context);
                Builder(
                  builder: (context) {
                    Scaffold.of(context).closeEndDrawer();
                    return const SizedBox.shrink();
                  },
                );
              },
              title: const Text('Clínica'),
              leading: const Icon(Icons.medical_services_outlined),
            ),
          ],
        ),
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
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      state.lat,
                      state.lon,
                    ),
                    zoom: 19,
                  ),
                  onMapCreated: _onCreatedMap,
                  markers: markers,
                ),
              ],
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
