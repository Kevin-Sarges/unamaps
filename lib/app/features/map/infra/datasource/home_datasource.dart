import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:unamaps/app/common/error/common_errors.dart';
import 'package:unamaps/app/common/model/local_model.dart';
import 'package:unamaps/app/features/map/domain/datasource/imap_datasource.dart';

class MapDataSource implements MapDataSourceImpl {
  final firebase = FirebaseFirestore.instance;

  @override
  Future<List<LocalEntity>> getLatLonLocal() async {
    try {
      final db = await firebase.collection('locais').get();

      final result = db.docs.map((doc) {
        final data = doc.data();

        return LocalModel(
          lat: data['lat'],
          lon: data['lon'],
          nomeLocal: data['nomeLocal'],
          marker: data['marker'],
          foto: data['foto'],
        );
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }

  @override
  Future<Position> getLatLonUser() async {
    try {
      final permission = await Geolocator.checkPermission();
      final request = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied &&
          request == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso á localização !!');
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Você precisa autorizar o acesso á localização !!');
      }

      final local = await Geolocator.getCurrentPosition();

      return local;
    } on PositionUpdateException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }
}
