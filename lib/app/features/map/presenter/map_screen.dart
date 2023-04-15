// ignore_for_file: avoid_function_literals_in_foreach_calls, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unamaps/app/common/utils/colors_app.dart';
import 'package:unamaps/app/features/map/presenter/controller/map_cubit.dart';
import 'package:unamaps/app/features/map/presenter/controller/map_state.dart';
import 'package:unamaps/app/features/map/presenter/widget/sala_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.andar}) : super(key: key);

  final String andar;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _cubit = GetIt.I.get<MapCubit>();
  Set<Marker> markers = <Marker>{};

  late GoogleMapController _controllerMap;

  void _onCreatedMap(GoogleMapController controller) {
    _controllerMap = controller;
  }

  @override
  void initState() {
    super.initState();

    _cubit.getUserPosition(widget.andar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.andar),
        backgroundColor: ColorsApp.green100,
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
                markers.clear();
                setState(() {
                  _cubit.getUserPosition(widget.andar);
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
                markers.clear();
                setState(() {
                  _cubit.filter('Banheiros', widget.andar);
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
              leading: const Icon(Icons.wc),
            ),
            ListTile(
              onTap: () {
                markers.clear();
                setState(() {
                  _cubit.filter('Lab', widget.andar);
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
                markers.clear();
                setState(() {
                  _cubit.filter('Elevador', widget.andar);
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
                markers.clear();
                setState(() {
                  _cubit.filter('Clínica', widget.andar);
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
          if (state is MapLoading) {
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

          if (state is MapSuccess) {
            final locais = state.local;

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
                    snippet: local.tipoLocal,
                  ),
                  onTap: () => {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SalaWidget(local: local),
                    ),
                  },
                ),
              );

              setState(() {});
            });

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
