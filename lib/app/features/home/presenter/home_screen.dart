import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_cubit.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cubit = GetIt.I.get<HomeCubit>();
  late GoogleMapController _controllerMap;

  _onCreatedMap(GoogleMapController controller) {
    _controllerMap = controller;
  }

  @override
  void initState() {
    super.initState();

    _cubit.getLocalPosition();
    _cubit.getUserPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1º Andar'),
        backgroundColor: const Color.fromRGBO(17, 104, 20, 1),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is HomeLoadgin) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(17, 104, 20, 1),
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Text(state.erro.errorMessage),
            );
          }

          if (state is HomeLocalLatLon) {
            final locais = state.local.map((map) {
              return Marker(
                markerId: MarkerId(map.nomeLocal),
                position: LatLng(
                  map.lat,
                  map.lon,
                ),
              );
            });

            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(
                  -1.4388016,
                  -48.4786402,
                ),
                zoom: 19,
              ),
              onMapCreated: _onCreatedMap,
              markers: locais.toSet(),
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
